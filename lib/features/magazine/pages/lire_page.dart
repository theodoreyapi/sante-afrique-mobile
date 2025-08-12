import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../core/themes/themes.dart';

class LirePage extends StatefulWidget {
  const LirePage({super.key});

  @override
  State<LirePage> createState() => _LirePageState();
}

class _LirePageState extends State<LirePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Lecture")),
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
