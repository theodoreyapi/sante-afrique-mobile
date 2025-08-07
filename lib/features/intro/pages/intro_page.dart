import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../../auths/login/login.dart';
import '../../auths/register/pages/pages.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int _pageIndex = 0;
  late int _nbreSlides;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => checkLogin());
    _pageController = PageController(initialPage: 0);
    _nbreSlides = demoData.length;
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? role = pref.getString("role");
    if (role != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Container()),
        (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/logo.png",
                height: 86,
                width: 199,
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: demoData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder:
                    (context, index) => TestScreenContent(
                      images: demoData[index].images,
                      titre: demoData[index].titre,
                      subTitre: demoData[index].subTitre,
                    ),
              ),
            ),
            Gap(2.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(2.w),
                Expanded(
                  child: SubmitButton(
                    AppConstants.btnRegister,
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                  ),
                ),
                Gap(2.w),
                Expanded(
                  child: CancelButton(
                    AppConstants.btnLogin,
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
                Gap(2.w),
              ],
            ),
            Gap(2.h),
            Container(
              padding: EdgeInsets.all(3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text("PASSER", style: TextStyle(color: appWhite)),
                  ),
                  Spacer(),
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      if (_pageIndex + 1 < _nbreSlides) {
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      }
                    },
                    child: Text("SUIVANT", style: TextStyle(color: appWhite)),
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

class TestScreenContent extends StatelessWidget {
  const TestScreenContent({
    super.key,
    required this.titre,
    required this.subTitre,
    required this.images,
  });

  final String titre, subTitre, images;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Center(child: Image.asset(images))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titre,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: appColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(2.w),
            Text(
              subTitre,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Onboard {
  final String titre, subTitre, images;

  Onboard({required this.titre, required this.subTitre, required this.images});
}

final List<Onboard> demoData = [
  Onboard(
    images: "assets/images/garde.png",
    titre: "Pharmacie de garde",
    subTitre:
        "Accédez en un clic aux pharmacies de garde disponibles dans votre commune, 24h/24.",
  ),
  Onboard(
    images: "assets/images/prix.png",
    titre: "Fiche et prix des médicaments",
    subTitre:
        "Consultez les prix des médicaments ainsi que la notice avant de vous rendre en pharmacie",
  ),
  Onboard(
    images: "assets/images/assurance.png",
    titre: "Assurances acceptées",
    subTitre: "Vérifiez quelles pharmacies acceptent votre couverture santé.",
  ),
  Onboard(
    images: "assets/images/recherche.png",
    titre: "Recherche de médicaments",
    subTitre:
        "Envoyez une requête pour vérifier la disponibilité de vos médicaments "
        "dans toutes les pharmacies de Côte d’Ivoire avec une option de réservation.",
  ),
  Onboard(
    images: "assets/images/portefeuille.png",
    titre: "Portefeuille électronique",
    subTitre:
        "Problème de jeton ? recevez votre petite monnaie directement "
        "sur votre téléphone et réutilisez la plus tard dans toutes les autres pharmacies",
  ),
  Onboard(
    images: "assets/images/vaccination.png",
    titre: "Vaccination",
    subTitre:
        "Suivez vos calendriers vaccinaux, configurez des rappels et "
        "accédez aux prix des vaccins en un clic.",
  ),
  Onboard(
    images: "assets/images/store.png",
    titre: "Store de produits Cosmétique",
    subTitre:
        "Achetez des produits de beauté et de bien-être en ligne et faites vous livrer.",
  ),
];

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: 2.w,
      width: isActive ? 5.w : 2.w,
      decoration: BoxDecoration(
        color: isActive ? appColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
