import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varzesh3_abstract/components/my_colors.dart';
import 'package:varzesh3_abstract/view/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColors.bg,
        body: MainScreen(),
      ),
    );
  }
}
