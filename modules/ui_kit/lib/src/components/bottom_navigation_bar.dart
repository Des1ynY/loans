import 'package:flutter/material.dart';
import '../../spacing.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<NavigationDestination> items;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar(
      {required this.currentIndex, required this.items, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      destinations: items.map((item) {
        final index = items.indexOf(item);
        final isSelected = index == currentIndex;
        final color = isSelected ? Colors.red : Colors.grey;
        return NavigationDestination(
          icon: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSpacingM), color: color),
            child: item.icon,
          ),
          label: item.label,
        );
      }).toList(),
    );
  }
}
