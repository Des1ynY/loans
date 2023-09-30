import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../constants.dart';
import '../theme/theme.dart';
import 'vector_picture.dart';

enum UserAvatarIcons {
  red,
  green,
  blue,
  orange,
  purple,
  peach;

  factory UserAvatarIcons.random() {
    final rndIndex = Random().nextInt(UserAvatarIcons.values.length);

    return UserAvatarIcons.values.elementAt(rndIndex);
  }

  LinearGradient get gradient {
    return switch (this) {
      UserAvatarIcons.red => $RedGradient,
      UserAvatarIcons.green => $GreenGradient,
      UserAvatarIcons.blue => $BlueGradient,
      UserAvatarIcons.orange => $OrangeGradient,
      UserAvatarIcons.purple => $PurpleGradient,
      UserAvatarIcons.peach => $PeachGradient,
    };
  }
}

class UserAvatarIcon extends StatelessWidget {
  final String iconPath;

  final double size;
  final LinearGradient gradient;

  const UserAvatarIcon({
    required this.gradient,
    this.size = defaultSize,
    super.key,
  }) : iconPath = defaultIcon;

  UserAvatarIcon.fromPreset({
    required UserAvatarIcons preset,
    this.size = defaultSize,
    super.key,
  })  : gradient = preset.gradient,
        iconPath = defaultIcon;

  const UserAvatarIcon.unknown({
    this.size = defaultSize,
    super.key,
  })  : gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2C2C2E), Color(0xFF414142)],
        ),
        iconPath = 'assets/question_mark.vec';

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(kRadiusL),
          gradient: gradient,
        ),
        child: VectorPicture.asset(
          iconPath,
          height: size,
          width: size,
        ),
      ),
    );
  }

  static const defaultSize = 36.0;
  static const defaultIcon = 'assets/user_avatar.vec';
}
