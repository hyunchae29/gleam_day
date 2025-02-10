import 'package:go_router/go_router.dart';
import 'frame_page.dart';

import '../start_page.dart';
import '../recommend/introduction.dart';
import '../recommend/recommendation.dart';
import '../recommend/history.dart';
import '../recommend/fortune.dart';

import '../note/note_main.dart';

import '../emoji/emoji_main.dart';

import '../member/member_main.dart';
import '../member/member_login.dart';
import '../member/member_settings.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const StartPage(), // 시작 페이지
      ),
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
                    path: 'history',
                    builder: (context, state) => const History()),
                GoRoute(
                    path: 'fortune',
                    builder: (context, state) => const Fortune())
              ]),
          GoRoute(
            path: '/note',
            builder: (context, state) => const NoteMain(),
            //routes: [
            //   GoRoute(
            //       path: '/example',
            //       builder: (context, state) => const Example())
            // ]  하위용
          ),
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
              builder: (context, state) => const MemberMain(),
              routes: [
                GoRoute(
                    path: 'login',
                    builder: (context, state) => const MemberLogin()),
                GoRoute(
                    path: 'settings',
                    builder: (context, state) => const MemberSettings()),
              ]),
          // 추가 경로는 여기에 정의
        ],
      ),
    ],
  );
}
