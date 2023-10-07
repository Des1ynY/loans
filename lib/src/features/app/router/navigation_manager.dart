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
        onTap: navigationShell.goBranch,
        items: [
          NavigationDestination(
            icon: const Icon(Icons.currency),
            label: context.locales.navigation_destination_profile,
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
      ),
    );
  }
}
