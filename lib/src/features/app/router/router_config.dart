import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:loans/src/features/app/router/navigation_manager.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page.dart';
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
      builder: (context, state, navigationShell) => navigationShell,
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
      routes: [
        GoRoute(
          path: 'phone-verification',
          builder: (context, state) {
            if (state.extra == null) throw Exception('Phone must be provided with extra');

            // ignore: cast_nullable_to_non_nullable
            final phone = (state.extra as Map<String, dynamic>)['phone'] as String;

            return PhoneVerificationPage(phone: phone);
          },
        ),
      ],
    ),
  ],
);

extension GoRouterGetter on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
