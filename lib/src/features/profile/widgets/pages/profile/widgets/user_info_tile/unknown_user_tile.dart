part of 'user_info_tile.dart';

class _UnknownUserTile extends UserInfoTile {
  const _UnknownUserTile({super.key}) : super._();

  @override
  Widget build(BuildContext context) {
    return _UserInfoTileLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserAvatarIcon.unknown(size: 56),
          const SizedBox(width: kSpacingS),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.locales.profile_unknown_user,
                  style: context.headerStyles.h3.copyWith(
                    color: context.textColors.primary,
                  ),
                ),
                const SizedBox(height: kSpacingXS),
                const UserVerificationIndicator.unverified(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
