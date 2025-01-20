import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(EmergencyResponseApp());
}

class EmergencyResponseApp extends StatelessWidget {
  const EmergencyResponseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Emergency Response',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
