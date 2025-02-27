import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int initialIndex;

  const TopAppBar({
    Key? key,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateCurrentIndex();
    });
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _updateCurrentIndex() {
    String currentPath = GoRouterState.of(context).uri.toString();
    if (currentPath == '/home') {
      currentIndex = 0;
    } else if (currentPath == '/home/recommendation') {
      currentIndex = 1;
    } else if (currentPath == '/home/history') {
      currentIndex = 2;
    } else if (currentPath == '/home/fortune') {
      currentIndex = 3;
    }
  }

  void onMenuTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.go('/home');
        _updateCurrentIndex();
        break;
      case 1:
        context.push('/home/recommendation');
        _updateCurrentIndex();
        break;
      case 2:
        context.push('/home/history');
        _updateCurrentIndex();
        break;
      case 3:
        context.push('/home/fortune');
        _updateCurrentIndex();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuTitles = ['홈', '추천', '과거의 오늘', '포춘쿠키'];

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      title: Text(
        'Gleam Day',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(menuTitles.length, (index) {
            final isSelected = index == currentIndex;
            return GestureDetector(
              onTap: () => onMenuTap(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    menuTitles[index],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 2,
                      width: 20,
                      color: Colors.black,
                    ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
