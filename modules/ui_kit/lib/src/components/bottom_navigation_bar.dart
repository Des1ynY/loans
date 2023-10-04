import 'package:flutter/material.dart';

// import '../../spacing.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<NavigationDestination> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.items,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.purple,
      indicatorColor: Colors.blue,
      animationDuration: const Duration(milliseconds: 100),
      destinations: items,
    );
  }
}
