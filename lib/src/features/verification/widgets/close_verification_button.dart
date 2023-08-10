import 'package:flutter/material.dart' hide ButtonStyle, IconButton;
import 'package:loans/src/features/app/router/router_config.dart';
import 'package:ui_kit/ui_kit.dart';

class CloseVerificationButton extends StatelessWidget {
  const CloseVerificationButton({super.key});

  void _navigateBack(BuildContext context) {
    context.router.go('/profile');
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 48, height: 48),
      child: IconButton.medium(
        onPressed: () => _navigateBack(context),
        style: ButtonStyle.tertiary,
        icon: Icon(
          Icons.chevron_left,
          size: 34,
          color: context.textColors.primary,
        ),
      ),
    );
  }
}
