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
import '../emoji/add_emoji.dart';
import '../emoji/edit_emoji.dart';

import '../member/member_main.dart';
import '../member/X_member_login.dart';
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
            pageBuilder: (context, state) => NoTransitionPage(
              child: const Introduction(),
            ),
            routes: [
              GoRoute(
                path: 'recommendation',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const Recommendation(),
                ),
              ),
              GoRoute(
                path: 'new_recommendation',
                pageBuilder: (context, state) {
                  final option = state.extra as Map<String, String>? ??
                      {"key": "default", "label": "기본 추천"};
                  return NoTransitionPage(
                    child: NewRecommendation(option: option),
                  );
                },
              ),
              GoRoute(
                path: 'result',
                pageBuilder: (context, state) {
                  final emoji = state.extra as Emoji;
                  return NoTransitionPage(
                    child: ResultPage(emoji: emoji),
                  );
                },
              ),
              GoRoute(
                path: 'history',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const History(),
                ),
              ),
              GoRoute(
                path: 'fortune',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const Fortune(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/note',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const NoteMain(),
            ),
            routes: [
              GoRoute(
                path: 'add_note',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const AddNote(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/emoji',
            pageBuilder: (context, state) => NoTransitionPage(
              child: const EmojiMain(),
            ),
            routes: [
              GoRoute(
                path: 'add_emoji',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const AddEmoji(),
                ),
              ),
              GoRoute(
                path: 'edit_emoji',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const EditEmoji(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/my',
            pageBuilder: (context, state) => NoTransitionPage(
              child: MemberMain(),
            ),
            routes: [
              GoRoute(
                path: 'login',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const MemberLogin(),
                ),
              ),
              GoRoute(
                path: 'settings',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: const MemberSettings(),
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/recommend_message',
            builder: (context, state) => const RecommendMessageDialog(),
            //routes: [
            //   GoRoute(
            //       path: '/example',
            //       builder: (context, state) => const Exam ple())
            // ]  하위용
          ),
        ],
      ),
    ],
  );
}
