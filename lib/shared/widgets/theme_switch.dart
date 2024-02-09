import 'package:commit_tracker/shared/controllers/theme_comtroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:rive/rive.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  SMIBool? _isDark;
  final ThemeController themeController = Get.find();

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);

    _isDark = controller.findInput<bool>('isDark') as SMIBool;
    bool isDarkMode = themeController.isDark;
    _isDark?.change(isDarkMode);
  }

  void _toggleTheme(BuildContext context) async {
    bool isDark = themeController.isDark;

    themeController.changeTheme(!isDark);

    _isDark?.change(!isDark);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: GestureDetector(
        onTap: () {
          _toggleTheme(context);
        },
        child: RiveAnimation.asset(
          'assets/animations/dark_light_switch.riv',
          fit: BoxFit.cover,
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
