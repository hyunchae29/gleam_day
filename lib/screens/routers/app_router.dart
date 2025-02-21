import 'package:go_router/go_router.dart';
import 'frame_page.dart';
import '../../models/emoji_model.dart';

import '../../common/recommend_message.dart';

import '../start_page.dart';

import '../recommend/introduction.dart';
import '../recommend/recommendation.dart';
import '../recommend/new_recommendation.dart';
import '../recommend/history.dart';
import '../recommend/fortune.dart';
import '../recommend/result.dart';

import '../note/note_main.dart';
import '../note/add_note.dart';

import '../emoji/emoji_main.dart';

import '../member/member_main.dart';
import '../member/member_login.dart';
import '../member/member_settings.dart';

// 에러페이지 또한 라우터로 관리가 가능, 이렇게 ㅎ자ㅏ

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartPage(), // 시작 페이지
      ),

      //todo JH bottomnavigation 사용법 변경. healthyclass 라우트 섹션 참고, nested route

      ShellRoute(
        builder: (context, state, child) => FramePage(child: child), // 공통 UI 적용
        routes: [
          GoRoute(
              path: '/home',
              builder: (context, state) => const Introduction(),
              routes: [
                GoRoute(
                  path: 'recommendation',
                  pageBuilder: (context, state) => CustomTransitionPage(
                    child: const Recommendation(),
                    transitionDuration: Duration.zero,
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  ),
                ),
                GoRoute(
                  path: 'new_recommendation',
                  builder: (context, state) {
                    final option = state.extra as Map<String, String>? ??
                        {"key": "default", "label": "기본 추천"};
                    return NewRecommendation(option: option);
                  },
                ),
                GoRoute(
                  path: 'result',
                  builder: (context, state) {
                    final emoji = state.extra as Emoji;
                    return ResultPage(emoji: emoji);
                  },
                ),
                GoRoute(
                    path: 'history',
                    builder: (context, state) => const History()),
                GoRoute(
                    path: 'fortune',
                    builder: (context, state) => const Fortune())
              ]),
          GoRoute(
              path: '/note',
              builder: (context, state) => const NoteMain(),
              routes: [
                GoRoute(
                    path: 'add_note',
                    builder: (context, state) => const AddNote()),
              ]),
          GoRoute(
            path: '/emoji',
            builder: (context, state) => const EmojiMain(),
            //routes: [
            //   GoRoute(
            //       path: '/example',
            //       builder: (context, state) => const Example())
            // ]  하위용
          ),
          GoRoute(
              path: '/my',
              builder: (context, state) => MemberMain(),
              routes: [
                GoRoute(
                    path: 'login',
                    builder: (context, state) => const MemberLogin()),
                GoRoute(
                    path: 'settings',
                    builder: (context, state) => const MemberSettings()),
              ]),
          GoRoute(
            path: '/recommend_message',
            builder: (context, state) => const RecommendMessageDialog(),
            //routes: [
            //   GoRoute(
            //       path: '/example',
            //       builder: (context, state) => const Example())
            // ]  하위용
          ),
        ],
      ),
    ],
  );
}
