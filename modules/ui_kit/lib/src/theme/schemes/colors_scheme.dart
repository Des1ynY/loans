// ignore_for_file: annotate_overrides

part of '../theme.dart';

@tailorMixin
final class ColorsScheme extends ThemeExtension<ColorsScheme> with _$ColorsSchemeTailorMixin {
  final SurfaceColors surface;
  final TextColors text;
  final BorderColors border;

  final Color transparent;

  const ColorsScheme({
    required this.surface,
    required this.text,
    required this.border,
  }) : transparent = const Color(0x00000000);
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

const $MainColorsScheme = ColorsScheme(
  surface: SurfaceColors(
    primary: Color(0xFF0A0A0A),
    secondary: Color(0xFF242426),
    tertiary: Color(0x80242426),
    invert: Color(0xFFFFFFFF),
    danger: Color(0xFFE93F36),
    success: Color(0xFF07B018),
    link: Color(0xFF1887FF),
    quaternary: Color(0xCC0A0A0A),
  ),
  text: TextColors(
    primary: Color(0xFFFFFFFF),
    secondary: Color(0xFFDEDEDE),
    tertiary: Color(0xFF838383),
    invert: Color(0xFF0A0A0A),
    danger: Color(0xFFE93F36),
    link: Color(0xFF1887FF),
  ),
  border: BorderColors(
    primary: Color(0x1AFFFFFF),
    selected: Color(0xFF1887FF),
  ),
);
