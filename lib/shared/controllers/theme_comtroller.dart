import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;
  ColorScheme get theme => isDark
      ? const ColorScheme.dark(primary: Colors.white)
      : const ColorScheme.light(primary: Colors.black);
  void changeTheme(bool val) async {
    box.write('darkmode', val);
    await Get.forceAppUpdate();
  }
}
