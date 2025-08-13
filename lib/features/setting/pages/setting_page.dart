import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/themes.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/buttons/buttons.dart';
import '../../auths/login/login.dart';
import '../../espace/espace.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  color: appColor,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bonjour \nM. MICHEL",
                        style: TextStyle(
                          color: appWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                      Gap(1.h),
                      Text(
                        "Merci de décrypter l'actualité à nos côtés depuis "
                        "le 25 Décembre 2024.",
                        style: TextStyle(
                          color: appWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                      Gap(1.h),
                      Text(
                        "Vous n'êtes pas Jean michel TIAPO ? "
                        "Cliquez ici pour vous déconnecter.",
                        style: TextStyle(
                          color: appWhite,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                // Card Sections
                buildSettingsCard([
                  buildTile(
                    icon: Icons.person_outline,
                    title: "Information personnelle",
                    onTap: () {},
                  ),
                  buildTile(
                    icon: Icons.badge_outlined,
                    title: "Profil d'emploi",
                    onTap: () {},
                  ),
                  buildTile(
                    icon: Icons.password_outlined,
                    title: "Mot de passe",
                  ),
                ]),
                SizedBox(height: 2.h),
                buildSettingsCard([
                  buildTile(
                    icon: Icons.rss_feed_outlined,
                    title: "Rubriques",
                    onTap: () {},
                  ),
                ]),
                SizedBox(height: 2.h),
                buildSettingsCard([
                  buildTile(
                    icon: Icons.notifications_active_outlined,
                    title: "Notifications",
                  ),
                  buildTile(icon: Icons.star, title: "Mes favoris"),
                ]),
                SizedBox(height: 2.h),
                buildSubscriptionCard(context),
                buildSettingsCard([
                  buildTile(
                    icon: Icons.request_page_outlined,
                    title: "Factures",
                    onTap: () {},
                  ),
                ]),
                SizedBox(height: 2.h),
                buildSettingsCard([
                  buildTile(
                    icon: Icons.info_outline,
                    title: "À propos",
                    onTap: () {},
                  ),
                  buildTile(
                    icon: Icons.security_outlined,
                    title: "Politique & confidentialité",
                    onTap: () {},
                  ),
                  buildTile(
                    icon: Icons.privacy_tip_outlined,
                    title: "Conditions d'utilisation",
                    onTap: () {},
                  ),
                  buildTile(
                    icon: Icons.tips_and_updates_outlined,
                    title: "FAQ",
                    onTap: () {},
                  ),
                ]),
                SizedBox(height: 2.h),
                buildSettingsCard([
                  buildTile(icon: Icons.share_outlined, title: "Partager l'application"),
                  buildTile(icon: Icons.chat, title: "Donnez votre avis"),
                  buildTile(
                    icon: Icons.contact_support_outlined,
                    title: "Nous suivre",
                    onTap: () {},
                  ),
                ]),
                SizedBox(height: 4.h),
                // Footer
                Container(
                  padding: EdgeInsets.all(2.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(2.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FutureBuilder(
                        future: PackageInfo.fromPlatform(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            final info = snapshot.data as PackageInfo;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  info.appName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: appColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  'Version ${info.version}+${info.buildNumber}',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                      IconButton(
                        onPressed: () => showLogoutDialog(context),
                        icon: Icon(Icons.logout, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSettingsCard(List<Widget> tiles) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: tiles),
    );
  }

  Widget buildTile({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return ListTile(
      dense: true,
      onTap: onTap,
      leading: Icon(icon, color: appBlack, size: 20.sp),
      title: Text(
        title,
        style: TextStyle(
          color: appBlack,
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
        ),
      ),
      trailing: Icon(Icons.navigate_next_outlined, color: appBlack),
    );
  }

  Widget buildSubscriptionCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        onTap: () {},
        leading: Icon(
          Icons.receipt_long_outlined,
          color: appColor,
          size: 20.sp,
        ),
        title: Text(
          "Abonnement",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
        ),
        subtitle: Text(
          "Encours",
          style: TextStyle(
            color: appColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: appColor,
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: TextButton(
            onPressed:
                () => showBarModalBottomSheet(
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
            child: Text(
              "Activer",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder:
          (_) => Padding(
            padding: EdgeInsets.all(4.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Voulez-vous vraiment vous déconnecter ?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 2.h),
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: Colors.orange.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(3.w),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.info_outline, color: Colors.orange),
                    title: Text(
                      "Cette action vous empêchera d'accéder à toutes les informations sur l'application",
                      style: TextStyle(color: Colors.orange, fontSize: 14.sp),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: CancelButton(
                        AppConstants.btnCancel,
                        height: 10.w,
                        fontSize: 15.sp,
                        textcouleur: appColor,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: SubmitButton(
                        AppConstants.btnLogout,
                        height: 10.w,
                        fontSize: 15.sp,
                        couleur: Colors.red,
                        onPressed: () async {
                          await SharedPreferencesHelper().clear();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginPage(),
                            ),
                            (_) => false,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
