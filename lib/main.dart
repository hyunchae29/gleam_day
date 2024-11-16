import 'package:flutter/material.dart';
import 'screens/tutorial/tutorial_main.dart';

void main() {
  runApp(const GleamDayApp());
}

class GleamDayApp extends StatelessWidget {
  const GleamDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gleam Day',
      theme: ThemeData.dark(),
      home: const TutorialMain(),
    );
  }
}