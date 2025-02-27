import 'core/theme.dart';
import 'dart:io';
import 'database/sqlite/database_helper.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/routers/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ✅ Kakao SDK 초기화 추가
  KakaoSdk.init(nativeAppKey: 'f5eb2e11e8b8d46a6f584b253b1f614a');

  await resetDatabase(); // 기존 db 삭제 및 초기화
  final db = await DatabaseHelper
      .instance.database; // database_helper.dart의 onCreate가 다시 실행됨
  await checkDatabaseFile(db); // 새로운 테이블도 포함된 DB가 자동 생성됨

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );

  runApp(
    ProviderScope(
      child: const GleamDayApp(),
    ),
  );
}

Future<void> checkDatabaseFile(Database db) async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'gleamday.db');

  final fileExists = await File(path).exists();

  if (fileExists) {
    print('✅ Database file exists at: $path'); //SQLiteStudio 확인용
  } else {
    print('❌ Database file does not exist. Check your initialization code.');
  }
}

Future<void> resetDatabase() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'gleamday.db');

  if (await databaseExists(path)) {
    await deleteDatabase(path);
    print("⚠️ 기존 데이터베이스 삭제됨");
  }
}

class GleamDayApp extends StatelessWidget {
  const GleamDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Gleam Day',
        theme: appTheme,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
