import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/widgets/widgets.dart';
import '../forgot.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isEmail = true;

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

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  String phoneIndicator = "";
  String initialCountry = 'CI';
  PhoneNumber number = PhoneNumber(isoCode: 'CI');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 60.w,
                    height: 30.w,
                  ),
                  Text(
                    "Mot de passe oublié",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    "Entrez votre adresse e-mail ou numéro de téléphone"
                    " qui est associé a votre "
                    "compte et vous receverai un code OTP pour "
                    "réinitialisation de mot de passe.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
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
                            color:
                                _isFocused
                                    ? appColor
                                    : Colors.transparent,
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
                            selectorType:
                                PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          initialValue: number,
                          textFieldController: login,
                          formatInput: true,
                          keyboardType:
                              const TextInputType.numberWithOptions(
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
                            ? "Retrouvr avec un numéro de téléphone"
                            : "Retrouver avec une adresse e-mail",
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
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: appWhite,
        padding: EdgeInsets.all(3.w),
        child: SubmitButton(
          AppConstants.btnPassword,
          fontSize: 18.sp,
          couleur: appColorRed,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CodeOtpPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
