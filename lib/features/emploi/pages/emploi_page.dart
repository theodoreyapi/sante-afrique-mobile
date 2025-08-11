import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';
import '../../../core/widgets/inputs/inputs.dart';
import '../emploi.dart';

class EmploiPage extends StatefulWidget {
  const EmploiPage({super.key});

  @override
  State<EmploiPage> createState() => _EmploiPageState();
}

class _EmploiPageState extends State<EmploiPage> {
  var search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: InputText(
                      hintText: "Rechercher...",
                      keyboardType: TextInputType.text,
                      controller: search,
                      prefixIcon: Icon(Icons.search_outlined),
                      validatorMessage: "Veuillez saisir un mot",
                    ),
                  ),
                  Gap(1.w),
                  FloatingActionButton(
                    elevation: 0,
                    backgroundColor: appColor,
                    onPressed: () {},
                    child: Icon(
                      Icons.tune_outlined,
                      size: 22.sp,
                      color: appWhite,
                    ),
                  ),
                ],
              ),
              Gap(2.h),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: appColor,
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: appFondCard,
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            child: Text(
                              "AD",
                              style: TextStyle(
                                color: appColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Gap(2.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr Awa Diallo",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Docteur en cardiologie",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  "Disponibilité : Immédiate, temps partiel",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Année d’expérience : 10 ans",
                                      style: TextStyle(
                                        color: appWhite,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => DetailEmploiPage(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.lock_outline,
                                            color: appWhite,
                                            size: 15.sp,
                                          ),
                                          Text(
                                            "Voir le CV",
                                            style: TextStyle(
                                              color: appWhite,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      padding: EdgeInsets.all(3.w),
                      decoration: BoxDecoration(
                        color: appFondCard,
                        borderRadius: BorderRadius.circular(4.w),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.w),
                            decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(4.w),
                            ),
                            child: Text(
                              "AD",
                              style: TextStyle(
                                color: appWhite,
                                fontWeight: FontWeight.w400,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          Gap(2.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr Awa Diallo",
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Docteur en cardiologie",
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  "Disponibilité : Immédiate, temps partiel",
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Année d’expérience : 10 ans",
                                      style: TextStyle(
                                        color: appBlack,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    InkWell(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.lock_outline,
                                            color: appBlack,
                                            size: 15.sp,
                                          ),
                                          Text(
                                            "Voir le CV",
                                            style: TextStyle(
                                              color: appBlack,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
