import 'package:flutter/material.dart';
import 'package:loans/src/features/app/router/router_config.dart';

class LoansApp extends StatelessWidget {
  const LoansApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: $RouterConfig,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
