import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:loans/src/features/app/router/navigation_manager.dart';
import 'package:loans/src/features/authentication/widgets/auth_scope.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page.dart';
import 'package:loans/src/features/authentication/widgets/pages/login/login_page_scope.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page.dart';
import 'package:loans/src/features/authentication/widgets/pages/phone_verification/phone_verification_page_scope.dart';
import 'package:loans/src/features/loans/widgets/pages/active_loans/active_loans_page.dart';
import 'package:loans/src/features/profile/widgets/pages/profile/profile_page.dart';
import 'package:loans/src/features/session/widgets/pages/new_session/new_session_page.dart';
import 'package:loans/src/features/verification/widgets/pages/verification_offer_page.dart';
import 'package:loans/src/shared/utils/logger/navigator_observer.dart';

final $RouterConfig = GoRouter(
  initialLocation: '/profile/verification',
  observers: [NavigationLogger()],
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
              routes: [
                GoRoute(
                  path: 'verification',
                  builder: (context, state) => const VerificationOfferPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPageScope(child: LoginPage()),
      routes: [
        GoRoute(
          path: 'phone-verification',
          builder: (context, state) {
            final phone = state.extra;

            if (phone == null || phone is! String) {
              throw Exception('Phone must be provided with extra');
            }

            return PhoneVerificationPageScope(
              phone: phone,
              child: const PhoneVerificationPage(),
            );
          },
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    if (state.matchedLocation.contains('/login')) return state.uri.toString();

    final isAuthenticated = AuthScope.authBlocOf(context, listen: false).state.user != null;

    return isAuthenticated ? state.uri.toString() : '/login';
  },
);

extension GoRouterGetter on BuildContext {
  GoRouter get router => GoRouter.of(this);
}
