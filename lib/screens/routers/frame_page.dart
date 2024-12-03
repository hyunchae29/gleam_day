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
                  label: 'Calendar',
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
                  label: 'Bookmark',
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
                  label: 'Chat',
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
              showUnselectedLabels: false, // 라벨 숨김 설정
              showSelectedLabels: false, // 라벨 숨김 설정
              type: BottomNavigationBarType.fixed, // 아이템 이동 방지
              enableFeedback: false, // 클릭 시 진동 및 음향 효과 비활성화
              selectedFontSize: 0, // 선택된 항목의 폰트 크기를 0으로 설정
              unselectedFontSize: 0, // 선택되지 않은 항목의 폰트 크기를 0으로 설정
            )
          : null,
    );
  }
}
