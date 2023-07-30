import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:loans/src/features/app/router/navigation_manager.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page.dart';
import 'package:loans/src/features/loans/widgets/pages/active_loans/active_loans_page.dart';
import 'package:loans/src/features/profile/widgets/pages/profile/profile_page.dart';
import 'package:loans/src/features/session/widgets/pages/new_session/new_session_page.dart';

final $RouterConfig = GoRouter(
  initialLocation: '/new-session',
  routes: [
    StatefulShellRoute(
      navigatorContainerBuilder: (context, navigationShell, children) => NavigationManager(
        navigationShell: navigationShell,
        children: children,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/loans',
              builder: (context, state) => const ActiveLoansPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/new-session',
              builder: (context, state) => const NewSessionPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

extension GoRouterGetter on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
