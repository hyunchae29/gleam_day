import 'package:go_router/go_router.dart';
import 'package:gleam_day/screens/main_page.dart';
import 'package:gleam_day/screens/tutorial/tutorial_main.dart';
import 'frame_page.dart';
import '../emoji/emoji_main.dart';
import '../emoji/emoji_create.dart';
import '../memo/memo_main.dart';
import '../recommendation/check_emotion.dart';
import '../recommendation/select_emoji.dart';
import '../recommendation/finding_page.dart';
import '../recommendation/result.dart';
import '../recommendation/success_1.dart';
import '../see_more/settings_page.dart';

GoRouter createRouter(bool hasSeenTutorial) {
  return GoRouter(
    //initialLocation: '/tutorial', //튜토리얼 무조건 나오게 ,, 테스트용
    initialLocation: '/main', //튜토리얼이 완료되면 메인 호출
    routes: [
      GoRoute(
        path: '/tutorial',
        builder: (context, state) => TutorialMain(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => MainPage(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return FramePage(child: child);
        },
        routes: [
          GoRoute(
            path: '/recommendation',
            builder: (context, state) => const CheckEmotion(),
            routes: [
              GoRoute(
                path: 'select_emoji',
                builder: (context, state) => const SelectEmoji(),
              ),
              GoRoute(
                path: 'finding_page',
                builder: (context, state) => const FindingPage(),
              ),
              GoRoute(
                path: 'result',
                builder: (context, state) => const Result(),
              ),
              GoRoute(
                path: 'success1',
                builder: (context, state) => const Success1(),
              ),
            ],
          ),
          GoRoute(
            path: '/memo',
            builder: (context, state) => const MemoMain(),
          ),
          GoRoute(
            path: '/emoji',
            builder: (context, state) => const EmojiMain(),
            routes: [
              GoRoute(
                path: 'emoji_create',
                builder: (context, state) => const EmojiCreate(),
              ),
            ],
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
}
