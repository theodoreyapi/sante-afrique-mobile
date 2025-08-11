import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sante_afrique/core/themes/themes.dart';
import 'package:sizer/sizer.dart';

class DetailEmploiPage extends StatefulWidget {
  const DetailEmploiPage({super.key});

  @override
  State<DetailEmploiPage> createState() => _DetailEmploiPageState();
}

class _DetailEmploiPageState extends State<DetailEmploiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appWhite,
      body: Stack(
        children: [
          Container(
            height: 25.h,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(3.w),
                bottomRight: Radius.circular(3.w),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(4.w),
              margin: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: appFondDetail,
                borderRadius: BorderRadius.circular(4.w),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close_outlined, color: appBlack),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: appBlack,
                          ),
                          height: 15.h,
                          width: 15.h,
                        ),
                        Gap(1.h),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: appBlack,
                              size: 15.sp,
                            ),
                            Text(
                              "Abidjan, Cocody",
                              style: TextStyle(
                                color: appBlack,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Text(
                      "Informations personnelles",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "+225",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Numéro de téléphone",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(1.h),
                    Text(
                      "Email",
                      style: TextStyle(
                        color: appColorText,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(2.h),
                    Text(
                      "Informations professionnelles",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Diplôme obtenu",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "N° d’Ordre obtenu",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Années d’expérience",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Spécialisation",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Text(
                      "Disponibilités",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Disponible a partir du",
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "10/07/2025",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Plage horaire",
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Matin, soir ...",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nombre de jours dispo par semaine",
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "4 jours",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Type de disponibilité ",
                                style: TextStyle(
                                  color: appColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Matin, soir ...",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Text(
                      "Zone de préférence",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pays",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Gap(1.h),
                              Text(
                                "Quartier",
                                style: TextStyle(
                                  color: appColorText,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Ville",
                            style: TextStyle(
                              color: appColorText,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(2.h),
                    Text(
                      "Autres infos",
                      style: TextStyle(
                        color: appColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Text(
                      "Type de structure",
                      style: TextStyle(
                        color: appColorText,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(1.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.w),
                        color: appWhite,
                        border: Border.all(color: appFondCard),
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.file_download_outlined,
                          color: appColorText,
                        ),
                        label: Text(
                          "Télécharger le cv",
                          style: TextStyle(
                            color: appColorText,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
