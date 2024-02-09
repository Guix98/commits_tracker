import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleStateMachine extends StatefulWidget {
  const SimpleStateMachine({Key? key}) : super(key: key);

  @override
  State<SimpleStateMachine> createState() => _SimpleStateMachineState();
}

class _SimpleStateMachineState extends State<SimpleStateMachine> {
  SMITrigger? _bump;

  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
    artboard.addController(controller!);
    _bump = controller.findInput<bool>('bump') as SMITrigger;
  }

  void _hitBump() => _bump?.fire();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _hitBump,
          child: RiveAnimation.network(
            'https://cdn.rive.app/animations/vehicles.riv',
            fit: BoxFit.cover,
            onInit: _onRiveInit,
          ),
        ),
      ),
    );
  }
}
