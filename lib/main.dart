import 'package:flutter/material.dart';
import 'package:interv_you/scenario_menu/scenario_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Interview Simulator',
      home: ScenarioMenuScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
