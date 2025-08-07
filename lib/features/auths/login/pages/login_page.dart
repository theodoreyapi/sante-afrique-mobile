import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../../menus/menus.dart';
import '../../forgot/forgot.dart';
import '../../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _isEmail = false;

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  var login = TextEditingController();
  var password = TextEditingController();

  String phoneIndicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  Future<void> loginUser(BuildContext context) async {
    // Afficher une boîte de dialogue de chargement
    showDialog(
      context: context,
      barrierDismissible: false, // Empêcher de fermer en cliquant dehors
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(width: 20),
              const Expanded(child: Text('Veuillez patienter...')),
            ],
          ),
        );
      },
    );

    try {
      // Autoriser les certificats auto-signés (attention en production)
      HttpClient().badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;

      final response = await http.post(
        Uri.parse(ApiUrls.postLoginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username':
              phoneIndicator.isEmpty
                  ? login.text
                  : phoneIndicator.replaceFirst("+", "00"),
          'password': password.text,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(
          utf8.decode(response.bodyBytes),
        );

        if (responseData['user']['active'] != "ACTIVE" &&
            responseData['user']['role'] != "PATIENT") {
          SnackbarHelper.showError(
            context,
            "Vous n'êtes pas autorisé à vous connecter",
          );
          return;
        } else {
          final subscriptions = responseData['user']['subscriptions'] ?? [];
          final subscriptionsJson = jsonEncode(subscriptions);

          // Sauvegarder toutes les infos utilisateur
          await Future.wait([
            SharedPreferencesHelper().saveString(
              'bearerToken',
              responseData['token']['token'],
            ),
            SharedPreferencesHelper().saveString('password', password.text),
            SharedPreferencesHelper().saveString(
              'lastRefreshTime',
              DateTime.now().toIso8601String(),
            ),
            SharedPreferencesHelper().saveString(
              'identifiant',
              responseData['user']['id'].toString(),
            ),
            SharedPreferencesHelper().saveString(
              'username',
              responseData['user']['username'],
            ),
            SharedPreferencesHelper().saveString(
              'email',
              responseData['user']['email'],
            ),
            SharedPreferencesHelper().saveString(
              'nom',
              responseData['user']['firstName'],
            ),
            SharedPreferencesHelper().saveString(
              'prenom',
              responseData['user']['lastName'],
            ),
            SharedPreferencesHelper().saveString(
              'phone',
              responseData['user']['phoneNumber'],
            ),
            SharedPreferencesHelper().saveString(
              'pays',
              responseData['user']['userDetails']['country'] ?? '',
            ),
            SharedPreferencesHelper().saveString(
              'about',
              responseData['user']['userDetails']['aboutMe'] ?? '',
            ),
            SharedPreferencesHelper().saveString(
              'photo',
              responseData['user']['userDetails']['profilePicture'] ?? '',
            ),
            SharedPreferencesHelper().saveDouble(
              'wallet',
              (responseData['user']['wallet']['amount'] ?? 0).toDouble(),
            ),
            SharedPreferencesHelper().saveInteger(
              'walletId',
              responseData['user']['wallet']['id'] ?? 0,
            ),
            SharedPreferencesHelper().saveString(
              'subscriptions',
              subscriptionsJson,
            ),
          ]);

          Navigator.pop(context);

          // Aller sur la page Menu
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MenuPage()),
            (route) => false,
          );
        }
      } else if (response.statusCode == 423) {
        Navigator.pop(context);
        SnackbarHelper.showWarning(
          context,
          "Votre compte n'est pas valide. "
          "Veuillez saisir le code reçu pour validation",
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => CodeOtpPage(
                  phone:
                      phoneIndicator.isEmpty
                          ? login.text
                          : phoneIndicator.replaceFirst("+", "00"),
                ),
          ),
        );
      } else {
        Navigator.pop(context);
        SnackbarHelper.showError(context, "Identifiants incorrects");
      }
    } catch (e) {
      Navigator.pop(context);
      SnackbarHelper.showError(context, "Erreur de connexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: 16.w),
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 70.w,
                        height: 25.w,
                      ),
                    ),
                  ),
                  Gap(4.h),
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    "Identifiez-vous et accédez aux actualités de Santé Afrique.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  Gap(2.h),
                  _isEmail
                      ? InputText(
                        hintText: "Adresse e-mail",
                        keyboardType: TextInputType.text,
                        controller: login,
                        validatorMessage: "Veuillez saisir votre email",
                      )
                      : Container(
                        padding: EdgeInsets.only(left: 4.w),
                        decoration: BoxDecoration(
                          color: appFondLogin,
                          borderRadius: BorderRadius.circular(3.w),
                          border: Border.all(
                            color: _isFocused ? appColor : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: InternationalPhoneNumberInput(
                          focusNode: _focusNode,
                          onInputChanged: (PhoneNumber number) {
                            phoneIndicator = number.phoneNumber!;
                          },
                          onInputValidated: (bool value) {},
                          errorMessage: "Le numéro est invalide",
                          hintText: "Numéro de téléphone",
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          initialValue: number,
                          textFieldController: login,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                            signed: true,
                            decimal: true,
                          ),
                          inputBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          onSaved: (PhoneNumber number) {},
                        ),
                      ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isEmail = !_isEmail;
                        login.clear();
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _isEmail
                            ? "Se connecter avec un numéro de téléphone"
                            : "Se connecter avec une adresse e-mail",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: appBlack,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  InputPassword(
                    hintText: "Mot de passe",
                    controller: password,
                    validatorMessage: "Veuillez saisir votre mot de passe",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscure = !_obscure;
                        });
                      },
                    ),
                  ),
                  Gap(1.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Mot de passe oublié ?",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: appBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SubmitButton(
                    AppConstants.btnLogin,
                    fontSize: 18.sp,
                    couleur: appColorRed,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                       // loginUser(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuPage()),
                              (route) => false,
                        );
                      } else {
                        SnackbarHelper.showError(
                          context,
                          "Tous les champs sont obligatoires",
                        );
                      }
                    },
                  ),
                  Gap(2.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15.sp, color: appBlack),
                      children: [
                        const TextSpan(text: "Vous n’avez pas de compte ? "),
                        TextSpan(
                          text: "Créer un compte",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                        ),
                        const TextSpan(text: "."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
