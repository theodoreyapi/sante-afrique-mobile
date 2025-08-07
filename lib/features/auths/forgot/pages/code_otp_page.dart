import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/widgets.dart';
import '../../login/login.dart';

class CodeOtpPage extends StatefulWidget {
  String? phone;

  CodeOtpPage({super.key, this.phone});

  @override
  State<CodeOtpPage> createState() => _CodeOtpPageState();
}

class _CodeOtpPageState extends State<CodeOtpPage> {
  final _formKey = GlobalKey<FormState>();
  String? otp;

  var login = TextEditingController();
  var password = TextEditingController();

  final _snackBar = const SnackBar(
    content: Text("Tous les champs sont obligatoires"),
    backgroundColor: Colors.red,
  );

  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  Future<void> verifyUser(BuildContext context) async {
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
              const Expanded(child: Text('Vérification...')),
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
        Uri.parse(ApiUrls.postValidateOtpUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'usernameOrEmail': widget.phone!.replaceFirst("+", "00"),
          'otpCode': otp,
          'method': "sms",
        }),
      );

      Navigator.pop(context);

      if (response.statusCode == 200) {
        SnackbarHelper.showSuccess(context, "Compte vérifié avec succès");

        // Naviguer vers la page de connexion
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
        );
        return;
      } else {
        SnackbarHelper.showError(context, "Code OTP invalide");
      }
    } catch (e) {
      Navigator.pop(context); // Fermer le dialog si une erreur survient
      SnackbarHelper.showError(context, "Erreur de connexion");
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 70,
      height: 70,
      textStyle: TextStyle(fontSize: 25.sp, color: appColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(color: appColor),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: appColor),
      borderRadius: BorderRadius.circular(3.w),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: appFondLogin),
    );

    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    width: 199,
                    height: 80,
                  ),
                  Text(
                    "Code OTP",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  Text(
                    "Un code OTP à été envoyé au \n${widget.phone}",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  Gap(4.h),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    controller: pinController,
                    pinputAutovalidateMode:
                        PinputAutovalidateMode.disabled,
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    showCursor: true,
                    onCompleted: (pin) {
                      otp = pin;
                    },
                    onChanged: (value) {},
                  ),
                  Gap(4.h),
                  Text(
                    "Delai de validité 01:00",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Renvoyer",
                      style: TextStyle(
                        color: appColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
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
        padding: EdgeInsets.all(4.w),
        child: SubmitButton(
          AppConstants.btnProceed,
          fontSize: 18.sp,
          couleur: appColorRed,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              verifyUser(context);

              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PositionPage()),
              );*/
            } else {
              ScaffoldMessenger.of(context).showSnackBar(_snackBar);
            }
          },
        ),
      ),
    );
  }
}
