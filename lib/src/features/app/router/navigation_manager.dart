import 'package:flutter/material.dart' hide Icons;
import 'package:go_router/go_router.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

class NavigationManager extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  const NavigationManager({
    required this.navigationShell,
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          NavigationDestination(
            icon: const Icon(Icons.currency),
            label: context.locales.profile,
          ),
          NavigationDestination(
            icon: const Icon(Icons.profile),
            label: context.locales.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.profile),
            label: context.locales.search,
          ),
        ],
        onTap: navigationShell.goBranch,
      ),
      // NavigationBar(
      //   selectedIndex: navigationShell.currentIndex,
      //   onDestinationSelected: navigationShell.goBranch,
      //   destinations:
      //   const [
      //     NavigationDestination(
      //       icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.amber)),
      //       label: 'Займы',
      //     ),
      //     NavigationDestination(
      //       icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.blue)),
      //       label: 'Создать',
      //     ),
      //     NavigationDestination(
      //       icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.green)),
      //       label: 'Профиль',
      //     ),
      //   ],
      // ),
    );
  }
}

// class CustomBottomNavigationBar extends StatelessWidget {
//   final int currentIndex;
//   final List<NavigationDestination> items;
//   final ValueChanged<int> onTap;

//   const CustomBottomNavigationBar(
//       {required this.currentIndex, required this.items, required this.onTap, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBar(
//       selectedIndex: currentIndex,
//       onDestinationSelected: onTap,
//       destinations: items.map((item) {
//         final index = items.indexOf(item);
//         final isSelected = index == currentIndex;
//         final color = isSelected ? Colors.red : Colors.grey;
//         return NavigationDestination(
//           icon: AnimatedContainer(
//             duration: const Duration(milliseconds: 300),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSpacingM), color: color),
//             child: item.icon,
//           ),
//           label: item.label,
//         );
//       }).toList(),
//     );
//   }
// }
