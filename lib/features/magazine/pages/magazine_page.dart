import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';
import '../magazine.dart';

class MagazinePage extends StatefulWidget {
  const MagazinePage({super.key});

  @override
  State<MagazinePage> createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage> {
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailMagazinePage()),
                );
              },
              child: Container(
                color: Colors.grey,
                height: 30.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(4.w),
                child: Image.asset("assets/magas/maga.jpg"),
              ),
            ),
            Text(
              "N16, Avril 2024",
              style: TextStyle(
                color: appBlack,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Gap(2.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(4.w),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2.h,
                    crossAxisSpacing: 2.w,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    // Tu peux remplacer par ta liste de données
                    final images = [
                      "assets/magas/maga1.jpg",
                      "assets/magas/maga2.jpg",
                      "assets/magas/maga1.jpg",
                      "assets/magas/maga2.jpg",
                      "assets/magas/maga1.jpg",
                      "assets/magas/maga2.jpg",
                    ];

                    return Column(
                      children: [
                        Image.asset(
                          images[index],
                          height: 20.h,
                          fit: BoxFit.cover,
                        ),
                        Gap(1.h),
                        Text(
                          "N16, Avril 2024",
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
