import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/auth_model.dart' as custom;
import '../repositories/auth_repository.dart';
import '../repositories/google_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

final authProvider = StateNotifierProvider<AuthProviderNotifier, User?>((ref) {
  return AuthProviderNotifier();
});

class AuthProviderNotifier extends StateNotifier<User?> {
  AuthProviderNotifier() : super(null);

  /// 🔹 로그인 실행
  Future<void> login(custom.AuthProvider provider) async {
    AuthRepository authRepository;

    switch (provider) {
      case custom.AuthProvider.google:
        authRepository = GoogleAuthRepository();
        break;
      case custom.AuthProvider.kakao:
        // TODO: KakaoAuthRepository 추가 예정
        return;
      case custom.AuthProvider.apple:
        // TODO: AppleAuthRepository 추가 예정
        return;
    }

    state = await authRepository.signIn();
  }

  /// 🔹 구글 로그인 바로 실행할 수 있도록 메서드 추가
  Future<void> loginGoogle() async {
    await login(custom.AuthProvider.google);
  }

  /// 🔹 로그아웃 실행
  Future<void> logout() async {
    if (state != null) {
      await GoogleAuthRepository().signOut();
      state = null;
    }
  }
}
