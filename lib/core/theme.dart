import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF201D1D);
  static const Color secondary = Color(0xFFFFD700);
  static const Color background = Color(0xFF202020);
}

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.brown,
  ).copyWith(
    secondary: AppColors.secondary,
    background: AppColors.background,
  ),
  scaffoldBackgroundColor: Colors.transparent,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Arima', // 영어 전용
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'NanumGothic', // 한글 전용
      fontSize: 16,
    ),
  ),
);

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
