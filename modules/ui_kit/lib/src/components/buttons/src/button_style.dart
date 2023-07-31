import 'package:flutter/widgets.dart';

import '../../../../theme.dart';

enum ButtonStyle { primary, secondary, tertiary, link }

extension ButtonStyleData on ColorsScheme {
  Color? backgroundColorFrom(ButtonStyle style, {bool disabled = false}) {
    final color = switch (style) {
      ButtonStyle.primary => surface.invert,
      ButtonStyle.secondary => surface.secondary,
      ButtonStyle.tertiary => null,
      ButtonStyle.link => null,
    };

    return color?.withAlpha(disabled ? color.alpha ~/ 2 : color.alpha);
  }

  Color foregroundColorFrom(ButtonStyle style, {bool disabled = false}) {
    final color = switch (style) {
      ButtonStyle.primary => text.invert,
      ButtonStyle.secondary => text.primary,
      ButtonStyle.tertiary => text.primary,
      ButtonStyle.link => text.link,
    };

    return color.withAlpha(disabled ? color.alpha ~/ 2 : color.alpha);
  }
}

enum ButtonSize {
  large,
  medium,
  small;

  BoxConstraints get buttonConstraints {
    return switch (this) {
      ButtonSize.large => const BoxConstraints.tightFor(width: double.infinity, height: 60),
      ButtonSize.medium => const BoxConstraints.tightFor(width: double.infinity, height: 48),
      ButtonSize.small => const BoxConstraints.tightFor(width: double.infinity, height: 32),
    };
  }

  BoxConstraints get iconButtonConstraints {
    return switch (this) {
      ButtonSize.large => const BoxConstraints.tightFor(width: 60, height: 60),
      ButtonSize.medium => const BoxConstraints.tightFor(width: 48, height: 48),
      ButtonSize.small => const BoxConstraints.tightFor(width: 32, height: 32),
    };
  }
}

extension ButtonSizeData on TextScheme {
  TextStyle captionStyleFrom(ButtonSize size) {
    return switch (size) {
      ButtonSize.large => paragraphs.mSemiBold,
      ButtonSize.medium => paragraphs.mSemiBold,
      ButtonSize.small => paragraphs.sSemiBold,
    };
  }
}
