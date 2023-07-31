import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'schemes/colors_scheme.dart';
part 'schemes/text_scheme.dart';
part 'theme.tailor.dart';

final $MainTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: $MainColorsScheme.surface.primary,
  extensions: const [$MainColorsScheme, $MainTextScheme],
);

extension ThemeGetters on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorsScheme get colors => theme.extension<ColorsScheme>()!;

  SurfaceColors get surfaceColors => colors.surface;

  TextColors get textColors => colors.text;

  BorderColors get borderColors => colors.border;

  TextScheme get texts => theme.extension<TextScheme>()!;

  HeadersScheme get headerStyles => texts.headers;

  ParagraphScheme get bodyStyles => texts.paragraphs;
}
