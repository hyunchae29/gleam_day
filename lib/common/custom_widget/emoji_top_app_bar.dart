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
    if (currentPath == '/emoji') {
      currentIndex = 0;
    } else if (currentPath == '/emoji/add_emoji') {
      currentIndex = 1;
    } else if (currentPath == '/emoji/edit_emoji') {
      currentIndex = 2;
    }
  }

  void onMenuTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 0:
        context.push('/emoji');
        _updateCurrentIndex();
        break;
      case 1:
        context.push('/emoji/add_emoji');
        _updateCurrentIndex();
        break;
      case 2:
        context.push('/emoji/edit_emoji');
        _updateCurrentIndex();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final menuTitles = ['홈', '새로 만들기', '수정하기'];

    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0.0,
      title: Text(
        'Emoji',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      centerTitle: false,
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
