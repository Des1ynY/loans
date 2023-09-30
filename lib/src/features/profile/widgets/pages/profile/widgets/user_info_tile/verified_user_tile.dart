part of 'user_info_tile.dart';

class _VerifiedUserTile extends UserInfoTile {
  final String displayName;

  const _VerifiedUserTile({
    required this.displayName,
    super.key,
  }) : super._();

  @override
  Widget build(BuildContext context) {
    return _UserInfoTileLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatarIcon.fromPreset(
            preset: UserAvatarIcons.random(),
            size: 56,
          ),
          const SizedBox(width: kSpacingS),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: context.headerStyles.h3.copyWith(
                    color: context.textColors.primary,
                  ),
                ),
                const SizedBox(height: kSpacingXS),
                const UserVerificationIndicator.verified(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
