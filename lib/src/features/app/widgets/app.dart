import 'package:flutter/material.dart';
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:loans/src/features/authentication/widgets/navigation_auth_guard.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/theme.dart';

class LoansApp extends StatelessWidget {
  const LoansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: $MainTheme,
      themeMode: ThemeMode.dark,
      supportedLocales: Locales.supportedLocales,
      localizationsDelegates: Locales.localizationsDelegates,
      routerConfig: $RouterConfig,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: NavigationAuthGuard(
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
