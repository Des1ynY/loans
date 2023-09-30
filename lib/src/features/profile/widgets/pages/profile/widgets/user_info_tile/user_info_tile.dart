import 'package:flutter/widgets.dart';
import 'package:loans/src/features/profile/widgets/pages/profile/widgets/user_info_tile/verification_indicator.dart';
import 'package:loans/src/shared/assets/assets.dart';
import 'package:loans/src/shared/l10n/l10n.dart';
import 'package:ui_kit/ui_kit.dart';

part 'unknown_user_tile.dart';
part 'verified_user_tile.dart';

abstract class UserInfoTile extends StatelessWidget {
  const UserInfoTile._({super.key});

  const factory UserInfoTile.verified({
    required String displayName,
    Key? key,
  }) = _VerifiedUserTile;

  const factory UserInfoTile.unknown({Key? key}) = _UnknownUserTile;
}

class _UserInfoTileLayout extends StatelessWidget {
  final Widget child;

  const _UserInfoTileLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(kRadiusXL),
        color: context.borderColors.primary,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: borderWidth),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(kRadiusXL),
            color: context.surfaceColors.primary,
          ),
          child: Row(
            children: [
              Expanded(child: child),
              const SizedBox(width: kSpacingM),
              Icon(
                Icons.chevronRight,
                size: 24,
                color: context.borderColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static const double borderWidth = 1;
}
