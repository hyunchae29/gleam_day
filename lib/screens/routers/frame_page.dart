import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme.dart'; // 테마 파일 import

class FramePage extends StatelessWidget {
  final Widget child;
  final bool showBottomNav;

  const FramePage({Key? key, required this.child, this.showBottomNav = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> routes = [
      '/home',
      '/note',
      '/emoji',
      '/my',
    ];

    final GoRouter goRouter = GoRouter.of(context);
    final String currentLocation =
        goRouter.routerDelegate.currentConfiguration?.uri.toString() ?? '';
    final int currentIndex = routes.indexOf(currentLocation);
    final int validIndex = currentIndex != -1 ? currentIndex : 0;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent, // Scaffold 배경 투명 설정
        body: child,
        bottomNavigationBar: showBottomNav
            ? Container(
                decoration: const BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.black, width: 1)),
                ),
                child: BottomNavigationBar(
                  currentIndex: validIndex,
                  onTap: (index) {
                    context.go(routes[index]);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        size: 28,
                      ),
                      activeIcon: Icon(
                        Icons.home,
                        size: 28,
                      ),
                      label: 'HOME',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.event_note_outlined,
                        size: 28,
                      ),
                      activeIcon: Icon(
                        Icons.event_note,
                        size: 28,
                      ),
                      label: 'NOTE',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        size: 28,
                      ),
                      activeIcon: Icon(
                        Icons.emoji_emotions,
                        size: 28,
                      ),
                      label: 'EMOJI',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person_outline,
                        size: 28,
                      ),
                      activeIcon: Icon(
                        Icons.person,
                        size: 28,
                      ),
                      label: 'MY',
                    ),
                  ],
                  showUnselectedLabels: true,
                  showSelectedLabels: true,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black45,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent, // 배경 투명
                  elevation: 0, // 그림자 제거
                ),
              )
            : null,
      ),
    );
  }
}
