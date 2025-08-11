import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../../auths/login/login.dart';
import '../magazine.dart';

class DetailMagazinePage extends StatefulWidget {
  const DetailMagazinePage({super.key});

  @override
  State<DetailMagazinePage> createState() => _DetailMagazinePageState();
}

class _DetailMagazinePageState extends State<DetailMagazinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      appBar: AppBar(
        backgroundColor: appWhite,
        centerTitle: true,
        title: Image.asset("assets/images/logo.png", height: 40),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/magas/maga.jpg", height: 35.h),
              Gap(1.h),
              CancelButton(
                "Extrait",
                fontSize: 18.sp,
                onPressed:
                    () => showBarModalBottomSheet(
                      barrierColor: appColor,
                      isDismissible: false,
                      enableDrag: false,
                      expand: true,
                      topControl: Align(
                        alignment: Alignment.centerLeft,
                        child: FloatingActionButton.small(
                          backgroundColor: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: appBlack),
                        ),
                      ),
                      context: context,
                      builder: (_) => ExtraitPage(),
                    ),
              ),
              Gap(1.h),
              SubmitButton(
                "Sommaire",
                fontSize: 18.sp,
                onPressed:
                    () => showBarModalBottomSheet(
                      barrierColor: appColor,
                      isDismissible: false,
                      enableDrag: false,
                      expand: true,
                      topControl: Align(
                        alignment: Alignment.centerLeft,
                        child: FloatingActionButton.small(
                          backgroundColor: Colors.white,
                          onPressed: () => Navigator.pop(context),
                          child: Icon(Icons.close, color: appBlack),
                        ),
                      ),
                      context: context,
                      builder: (_) => SommairePage(),
                    ),
              ),
              Gap(1.h),
              SubmitButton(
                AppConstants.btnConnexion,
                fontSize: 18.sp,
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
