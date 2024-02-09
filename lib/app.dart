import 'package:commit_tracker/shared/controllers/theme_comtroller.dart';
import 'package:commit_tracker/shared/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: themeController.isDark
            ? const ColorScheme.dark(primary: Colors.white)
            : const ColorScheme.light(primary: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
