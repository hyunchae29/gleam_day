import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent, // AppBar 배경 투명
    elevation: 0, // 그림자 제거
    titleTextStyle: TextStyle(
      fontFamily: 'Arima',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Arima', // english
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Arima', // english
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'NanumGothic', // korean
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'NanumGothic', // korean
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontFamily: 'NanumGothic', // korean
      fontSize: 11,
    ),
  ),
);

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // 텍스트 방향 설정
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          extendBodyBehindAppBar: true, // AppBar까지 배경 확장
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
