import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/buttons/buttons.dart';
import '../../../../core/widgets/inputs/inputs.dart';
import '../../forgot/forgot.dart';
import '../../login/login.dart';

class CreatePasswordPage extends StatefulWidget {
  String? email;
  String? name;
  String? lastName;
  String? phone;

  CreatePasswordPage({
    super.key,
    this.email,
    this.name,
    this.lastName,
    this.phone,
  });

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

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

  var password = TextEditingController();
  var confirmPassword = TextEditingController();

  Future<void> registerUser(BuildContext context) async {
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
        Uri.parse(ApiUrls.postRegisterUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': widget.phone!.replaceFirst("+", "00"),
          'email': widget.email,
          'phoneNumber': widget.phone!.replaceFirst("+", "00"),
          'firstName': widget.name,
          'lastName': widget.lastName,
          'typeUser': "PATIENT",
          'password': password.text,
        }),
      );

      if (response.statusCode == 201) {
        final codeOtp = await http.post(
          Uri.parse(ApiUrls.postGenerateOtpUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'usernameOrEmail': widget.phone!.replaceFirst("+", "00"),
            'otpCode': "",
            'method': "sms",
          }),
        );

        if (codeOtp.statusCode == 200) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) =>
                      CodeOtpPage(phone: widget.phone!.replaceFirst("+", "00")),
            ),
          );

          SnackbarHelper.showSuccess(
            context,
            "Votre compte a été créé avec succès",
          );
          return;
        } else {
          Navigator.pop(context);
          SnackbarHelper.showWarning(
            context,
            "Votre compte a été créé, mais impossible de valider votre compte",
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } else if (response.statusCode == 409) {
        Navigator.pop(context);
        SnackbarHelper.showError(context, "L'utilisateur existe déjà");
      } else {
        Navigator.pop(context);
        SnackbarHelper.showError(context, "Identifiants incorrects");
      }
    } catch (e) {
      Navigator.pop(context); // Fermer le dialog si une erreur survient
      SnackbarHelper.showError(context, "Erreur de connexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                Text(
                  "Sécurisé votre compte",
                  style: TextStyle(
                    color: appBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                Gap(5.h),
                InputPassword(
                  hintText: "Mot de passe",
                  controller: password,
                  validatorMessage:
                      "Veuillez saisir votre mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                ),
                Gap(1.h),
                InputPassword(
                  hintText: "Confirmez le mot de passe",
                  controller: confirmPassword,
                  validatorMessage:
                      "Veuillez saisir votre mot de passe",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscure = !_obscure;
                      });
                    },
                  ),
                ),
                Gap(10.h),
                SubmitButton(
                  AppConstants.btnSetup,
                  fontSize: 18.sp,
                  couleur: appColorRed,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (password.text == confirmPassword.text) {
                        registerUser(context);
                      } else {
                        SnackbarHelper.showError(
                          context,
                          "Votre mot de passe ne correspond pas",
                        );
                      }
                    } else {
                      SnackbarHelper.showError(
                        context,
                        "Tous les champs sont obligatoires",
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
