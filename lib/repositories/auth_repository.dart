import 'package:firebase_auth/firebase_auth.dart';

/// 🔹 로그인 방식 인터페이스 (공통 구조)
abstract class AuthRepository {
  Future<User?> signIn();
  Future<void> signOut();
}
