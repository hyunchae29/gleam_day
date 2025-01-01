import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/routers/app_router.dart';
import 'package:flutter/services.dart';
import 'database_helper.dart';
import 'package:sqflite/sqflite.dart'; // 추가

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // SQLite 데이터베이스 초기화
  await DatabaseHelper.instance.database;

  // 데이터베이스 파일 확인
  await checkDatabaseFile();

  final prefs = await SharedPreferences.getInstance();
  final bool hasSeenTutorial = prefs.getBool('hasSeenTutorial') ?? false;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );

  runApp(GleamDayApp(hasSeenTutorial: hasSeenTutorial));
}

Future<void> checkDatabaseFile() async {
  final dbPath = await getDatabasesPath(); // getDatabasesPath 메서드 정상 사용
  final path = join(dbPath, 'gleamday.db');

  final fileExists = await File(path).exists();

  if (fileExists) {
    print('Database file exists at: $path');
  } else {
    print('Database file does not exist. Check your initialization code.');
  }
}

class GleamDayApp extends StatefulWidget {
  final bool hasSeenTutorial;

  const GleamDayApp({super.key, required this.hasSeenTutorial});

  @override
  _GleamDayAppState createState() => _GleamDayAppState();
}

class _GleamDayAppState extends State<GleamDayApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createRouter(widget.hasSeenTutorial);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gleam Day',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF201D1D),
        canvasColor: const Color(0xFF201D1D),
        fontFamily: 'YujiMai',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 20,
            fontFamilyFallback: ['GowunBatang'],
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 20,
            fontFamilyFallback: ['GowunBatang'],
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontFamilyFallback: ['GowunBatang'],
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.5),
        ),
      ),
      routerConfig: _router,
    );
  }
}
