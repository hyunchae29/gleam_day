import 'dart:io';
import 'database/sqlite/database_helper.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme.dart';
import 'screens/routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DatabaseHelper.instance.database;
  await checkDatabaseFile();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
  );

  runApp(const GleamDayApp());
}

Future<void> checkDatabaseFile() async {
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'gleamday.db');

  final fileExists = await File(path).exists();

  if (fileExists) {
    print('Database file exists at: $path');
  } else {
    print('Database file does not exist. Check your initialization code.');
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
