import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sante_afrique/core/constants/constants.dart';
import 'package:sante_afrique/core/themes/themes.dart';
import 'package:sizer/sizer.dart';

class SommairePage extends StatefulWidget {
  const SommairePage({super.key});

  @override
  State<SommairePage> createState() => _SommairePageState();
}

class _SommairePageState extends State<SommairePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Sommaire")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: ListView(
            children: [
              Text(
                "L’EDITO",
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              Gap(1.h),
              Text(
                AppConstants.txtEdito,
                style: TextStyle(
                  color: appBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              Gap(2.h),
              Text(
                "L’EDITO",
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              Gap(1.h),
              Text(
                AppConstants.txtEdito,
                style: TextStyle(
                  color: appBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
              Gap(2.h),
              Text(
                "L’EDITO",
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              Gap(1.h),
              Text(
                AppConstants.txtEdito,
                style: TextStyle(
                  color: appBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
