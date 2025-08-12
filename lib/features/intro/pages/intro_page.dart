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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Row(
                children: [
                  ...List.generate(
                    demoData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(3.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "PASSER",
                      style: TextStyle(
                        color: appBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  FloatingActionButton.small(
                    backgroundColor: appColor,
                    shape: const CircleBorder(),
                    onPressed: () {
                      if (_pageIndex + 1 < _nbreSlides) {
                        // Aller à la page suivante
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 300),
                        );
                      } else {
                        // Dernière page → Aller au Login
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    },
                    child: Icon(
                      _pageIndex + 1 < _nbreSlides
                          ? Icons
                              .arrow_forward_outlined // Pages intermédiaires
                          : Icons.check, // Dernière page
                      color: appWhite,
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Center(child: Image.asset(images))),
        Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titre,
                style: TextStyle(
                  color: appColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(2.w),
              Text(
                subTitre,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
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
    images: "assets/intro/intro1.png",
    titre: "Santé Afrique",
    subTitre: "Infos fiables. Experts africains. Toujours avec vous.",
  ),
  Onboard(
    images: "assets/intro/intro2.png",
    titre: "Accès illimité",
    subTitre: "Créez votre compte. Abonnez-vous. Profitez sans limite.",
  ),
  Onboard(
    images: "assets/intro/intro3.png",
    titre: "Carrière santé",
    subTitre: "Publiez vos offres. Mettez votre CV. Trouvez des opportunités.",
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
