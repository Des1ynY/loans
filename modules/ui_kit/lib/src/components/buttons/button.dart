import 'src/button_base.dart';
import 'src/button_style.dart';
import 'src/icon_button_base.dart';

export 'src/button_style.dart' show ButtonStyle, ButtonStyleData;

class Button extends ButtonBase {
  const Button.large({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.caption,
    super.leading,
    super.trailing,
    super.key,
  }) : super(size: ButtonSize.large);

  const Button.medium({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.caption,
    super.leading,
    super.trailing,
    super.key,
  }) : super(size: ButtonSize.medium);

  const Button.small({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.caption,
    super.leading,
    super.trailing,
    super.key,
  }) : super(size: ButtonSize.small);
}

class IconButton extends IconButtonBase {
  const IconButton.large({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.icon,
    super.key,
  }) : super(size: ButtonSize.large);

  const IconButton.medium({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.icon,
    super.key,
  }) : super(size: ButtonSize.medium);

  const IconButton.small({
    required super.onPressed,
    super.style = ButtonStyle.primary,
    super.icon,
    super.key,
  }) : super(size: ButtonSize.small);
}
