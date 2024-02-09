import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  SMIBool? _isDark;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);

    _isDark = controller.findInput<bool>('isDark') as SMIBool;
  }

  void _toggleTheme() {
    print(_isDark);
    _isDark?.change(false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 100,
      child: GestureDetector(
        onTap: _toggleTheme,
        child: RiveAnimation.asset(
          'assets/animations/dark_light_switch.riv',
          fit: BoxFit.cover,
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
