import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../login/login.dart';
import '../register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

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

  var email = TextEditingController();
  var phone = TextEditingController();
  var name = TextEditingController();
  var lastName = TextEditingController();

  String phoneIndicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  late final bool _isChecked = true;

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
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 70.w,
                      height: 25.w,
                    ),
                  ),
                  Text(
                    "Créez votre compte",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Gap(2.h),
                  InputText(
                    hintText: "Nom",
                    keyboardType: TextInputType.text,
                    controller: name,
                    validatorMessage: "Veuillez saisir votre nom",
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Prénoms",
                    keyboardType: TextInputType.text,
                    controller: lastName,
                    validatorMessage: "Veuillez saisir votre prénom",
                  ),
                  Gap(1.h),
                  InputText(
                    hintText: "Adresse e-mail",
                    keyboardType: TextInputType.text,
                    controller: email,
                  ),
                  Gap(1.h),
                  Container(
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
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phone,
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
                  Gap(2.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Je souhaite recevoir :",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(value: _isChecked, onChanged: (value) {}),
                      Text(
                        "Les offres de santé Afrique",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: appBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 14.sp, color: appBlack),
                      children: [
                        TextSpan(text: AppConstants.txtRegister),
                        TextSpan(
                          text: "cliquez ici.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                  Gap(2.h),
                  SubmitButton(
                    AppConstants.btnSetup,
                    fontSize: 18.sp,
                    couleur: appColorRed,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CreatePasswordPage(
                                  email: email.text,
                                  name: name.text,
                                  lastName: lastName.text,
                                  phone: phoneIndicator,
                                ),
                          ),
                        );
                      } else {
                        SnackbarHelper.showError(
                          context,
                          "Tous les champs sont obligatoires",
                        );
                      }
                    },
                  ),
                  Gap(1.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 15.sp, color: appBlack),
                      children: [
                        const TextSpan(text: "Vous avez déjà un compte ? "),
                        TextSpan(
                          text: "Connectez-vous",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
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
