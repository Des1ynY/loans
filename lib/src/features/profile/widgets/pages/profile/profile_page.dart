import 'package:flutter/widgets.dart';
import 'package:loans/src/features/profile/widgets/pages/profile/widgets/user_info_tile/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.fromLTRB(24, 32, 24, 48),
          sliver: SliverToBoxAdapter(
            child: UserInfoTile.unknown(),
          ),
        ),
      ],
    );
  }
}
