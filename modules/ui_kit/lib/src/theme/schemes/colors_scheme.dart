// ignore_for_file: annotate_overrides

part of '../theme.dart';

@tailorMixin
final class ColorsScheme extends ThemeExtension<ColorsScheme> with _$ColorsSchemeTailorMixin {
  final SurfaceColors surface;
  final TextColors text;
  final BorderColors border;

  const ColorsScheme({
    required this.surface,
    required this.text,
    required this.border,
  });
}

@tailorMixinComponent
final class SurfaceColors extends ThemeExtension<SurfaceColors> with _$SurfaceColorsTailorMixin {
  final Color primary;
  final Color secondary;

  final Color tertiary;
  final Color invert;

  final Color danger;
  final Color success;

  final Color link;
  final Color quaternary;

  const SurfaceColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.invert,
    required this.danger,
    required this.success,
    required this.link,
    required this.quaternary,
  });
}

@tailorMixinComponent
final class TextColors extends ThemeExtension<TextColors> with _$TextColorsTailorMixin {
  final Color primary;
  final Color secondary;

  final Color tertiary;
  final Color invert;

  final Color danger;

  final Color link;

  const TextColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.invert,
    required this.danger,
    required this.link,
  });
}

@tailorMixinComponent
final class BorderColors extends ThemeExtension<BorderColors> with _$BorderColorsTailorMixin {
  final Color primary;
  final Color selected;

  const BorderColors({
    required this.primary,
    required this.selected,
  });
}
