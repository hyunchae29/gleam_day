import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

final kakaoAuthProvider =
    StateNotifierProvider<KakaoAuthNotifier, User?>((ref) {
  return KakaoAuthNotifier();
});

class KakaoAuthNotifier extends StateNotifier<User?> {
  KakaoAuthNotifier() : super(null);

  Future<void> login() async {
    try {
      // 카카오톡 설치 여부 확인 후 로그인 방식 결정
      OAuthToken token;
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }

      // 로그인 성공 시 사용자 정보 가져오기
      final user = await UserApi.instance.me();
      state = user;
    } catch (e) {
      print('카카오 로그인 실패: $e');
      state = null;
    }
  }

  Future<void> logout() async {
    try {
      await UserApi.instance.logout();
      state = null;
    } catch (e) {
      print('카카오 로그아웃 실패: $e');
    }
  }
}
