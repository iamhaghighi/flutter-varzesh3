import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:varzesh3/components/gestures.dart';
import 'components/my_colors.dart';
import 'view/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: MyColors.bg,
        body: MainScreen(),
      ),
    );
  }
}
