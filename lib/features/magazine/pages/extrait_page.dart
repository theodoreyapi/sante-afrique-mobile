import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';

class ExtraitPage extends StatefulWidget {
  const ExtraitPage({super.key});

  @override
  State<ExtraitPage> createState() => _ExtraitPageState();
}

class _ExtraitPageState extends State<ExtraitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Extrait")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset("assets/magas/maga.jpg", ),
              Image.asset("assets/magas/maga.jpg", ),
            ],
          ),
        ),
      ),
    );
  }
}
