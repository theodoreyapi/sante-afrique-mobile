import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../../auths/login/login.dart';
import '../espace.dart';

class EspacePage extends StatefulWidget {
  const EspacePage({super.key});

  @override
  State<EspacePage> createState() => _EspacePageState();
}

class _EspacePageState extends State<EspacePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: appWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(4.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    color: appWhite,
                  ),
                  labelColor: appColor,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: appWhite,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(text: "Pour vous"),
                    Tab(text: "Favoris"),
                    Tab(text: "Historiques"),
                  ],
                ),
              ),
              Gap(1.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SubmitButton(
                          AppConstants.btnConnexion,
                          fontSize: 18.sp,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                        ),
                        Gap(2.h),
                        SubmitButton(
                          AppConstants.btnPackage,
                          fontSize: 18.sp,
                          onPressed: ()=> showBarModalBottomSheet(
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
                            builder: (_) => AbonnePage(),
                          ),
                        ),
                      ],
                    ),
                    Container(),
                    Container(),
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
