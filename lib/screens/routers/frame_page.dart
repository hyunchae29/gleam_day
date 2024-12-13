import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FramePage extends StatelessWidget {
  final Widget child;
  final bool showBottomNav;

  const FramePage({Key? key, required this.child, this.showBottomNav = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> routes = [
      '/recommendation',
      '/memo',
      '/emoji',
      '/settings',
    ];

    // 현재 위치 가져오기
    final GoRouter goRouter = GoRouter.of(context);
    final String currentLocation =
        goRouter.routerDelegate.currentConfiguration?.uri.toString() ?? '';
    final int currentIndex = routes.indexOf(currentLocation);
    final int validIndex = currentIndex != -1 ? currentIndex : 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: showBottomNav
          ? BottomNavigationBar(
              currentIndex: validIndex,
              onTap: (index) {
                context.go(routes[index]);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    size: 28,
                  ),
                  activeIcon: Icon(
                    Icons.calendar_today,
                    size: 28,
                  ),
                  label: 'Recommendation',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.bookmark,
                    size: 35,
                  ),
                  label: 'Memo',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.tag_faces_outlined,
                    size: 35,
                  ),
                  activeIcon: Icon(
                    Icons.tag_faces,
                    size: 35,
                  ),
                  label: 'emoji',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_outlined,
                    size: 35, // 개별 아이콘 크기 설정
                  ),
                  activeIcon: Icon(
                    Icons.menu,
                    size: 35, // 개별 아이콘 크기 설정
                  ),
                  label: 'Menu',
                ),
              ],
              showUnselectedLabels: false,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed, // 아이템 이동 방지
              enableFeedback: false)
          : null,
    );
  }
}
