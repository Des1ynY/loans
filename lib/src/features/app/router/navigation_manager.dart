import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: const [
          NavigationDestination(
            icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.amber)),
            label: 'Займы',
          ),
          NavigationDestination(
            icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.blue)),
            label: 'Создать',
          ),
          NavigationDestination(
            icon: SizedBox.square(dimension: 25, child: ColoredBox(color: Colors.green)),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
