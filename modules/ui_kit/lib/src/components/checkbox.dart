import 'package:flutter/material.dart';

import '../../spacing.dart';
import '../theme/theme.dart';

// ignore: avoid_positional_boolean_parameters
typedef CheckBoxCallback = void Function(bool value);

class CheckBox extends StatelessWidget {
  final bool isSelected;
  final CheckBoxCallback? onChanged;

  final double size;
  final Widget? child;

  const CheckBox({
    required this.isSelected,
    this.size = CheckBox.defaultSize,
    this.onChanged,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged?.call(!isSelected),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.square(
            dimension: size,
            child: isSelected ? const _ActiveCheckBox() : const _InactiveCheckBox(),
          ),
          if (child != null) ...[
            const SizedBox(width: kSpacingXS),
            child!,
          ],
        ],
      ),
    );
  }

  static const defaultSize = 20.0;
}

class _ActiveCheckBox extends StatelessWidget {
  const _ActiveCheckBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: context.surfaceColors.invert,
            width: 5,
          ),
        ),
      ),
    );
  }
}

class _InactiveCheckBox extends StatelessWidget {
  const _InactiveCheckBox();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: context.borderColors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
