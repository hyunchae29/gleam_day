import 'package:go_router/go_router.dart';
import 'package:gleam_day/screens/main_page.dart'; // MainPage import
import 'package:gleam_day/screens/tutorial/tutorial_main.dart';
import 'frame_page.dart';
import '../emoji/emoji_main.dart';
import '../memo/memo_main.dart';
import '../recommendation/check_emotion.dart';
import '../see_more/settings_page.dart';

GoRouter createRouter(bool hasSeenTutorial) {
  return GoRouter(
    // initialLocation: hasSeenTutorial ? '/main' : '/tutorial',
    // initialLocation: '/tutorial',
    initialLocation: '/main',
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
            builder: (context, state) => const CheckEmotionPage(),
          ),
          GoRoute(
            path: '/memo',
            builder: (context, state) => const MemoMain(),
          ),
          GoRoute(
            path: '/emoji',
            builder: (context, state) => const EmojiMain(),
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
