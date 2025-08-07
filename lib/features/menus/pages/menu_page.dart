import 'package:flutter/material.dart';
import 'package:sante_afrique/core/constants/constants.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentPageIndex = 0;

  final Widget _home = Container();
  final Widget _echange = Container();
  final Widget _espace = Container();
  final Widget _emploi = Container();
  final Widget _menus = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          height: 40,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.search_outlined, size: 25.sp,),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(2.w),
            child: Image.asset("assets/images/icon.png"),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: appWhite,
        surfaceTintColor: appWhite,
        indicatorColor: appColor,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            icon: Text(
              "Santé \nAfrique",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: currentPageIndex == 0 ? appWhite : appBlack,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            label: "A la une",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.groups_outlined,
              color: currentPageIndex == 1 ? appWhite : appBlack,
            ),
            label: "Echange",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.article_outlined,
              color: currentPageIndex == 2 ? appWhite : appBlack,
            ),
            label: "Espace",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.business_center_outlined,
              color: currentPageIndex == 3 ? appWhite : appBlack,
            ),
            label: "Emploi",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.menu_outlined,
              color: currentPageIndex == 4 ? appWhite : appBlack,
            ),
            label: "Menu",
          ),
        ],
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (currentPageIndex == 0) {
      return _home;
    } else if (currentPageIndex == 1) {
      return _echange;
    } else if (currentPageIndex == 2) {
      return _espace;
    } else if (currentPageIndex == 3) {
      return _emploi;
    } else {
      return _menus;
    }
  }
}
