import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sante_afrique/core/themes/themes.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';

class EchangePage extends StatefulWidget {
  const EchangePage({super.key});

  @override
  State<EchangePage> createState() => _EchangePageState();
}

class _EchangePageState extends State<EchangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(4.w),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: ClipOval(
                      child: Image.asset("assets/images/wave.png"),
                    ),
                    title: Text(
                      "Jean Michel",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      "@jm",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 3.w),
                    child: Column(
                      children: [
                        Text(
                          AppConstants.subText,
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.thumb_up_alt_outlined),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.chat_bubble_outline),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.repeat),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
