import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sante_afrique/core/themes/themes.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';

class DetailHome extends StatefulWidget {
  const DetailHome({super.key});

  @override
  State<DetailHome> createState() => _DetailHomeState();
}

class _DetailHomeState extends State<DetailHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Santé univ",
                style: TextStyle(
                  color: appColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(2.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(3.w),
                child: Image.asset(
                  "assets/news/new.jpg",
                  height: 22.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(2.h),
              Text(
                AppConstants.subText,
                style: TextStyle(
                  color: appBlack,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(2.h),
              Text(
                AppConstants.textDoctor,
                style: TextStyle(
                  color: appBlack,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
