import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'schemes/colors_scheme.dart';
part 'theme.tailor.dart';

final $MainTheme = ThemeData(
  extensions: const [
    ColorsScheme(
      surface: SurfaceColors(
        primary: Color(0xFF0A0A0A),
        secondary: Color(0xFF242426),
        tertiary: Color(0x80242426),
        invert: Color(0xFFFFFFFF),
        danger: Color(0xFFE9F336),
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
    ),
  ],
);

extension ThemeGetters on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorsScheme get colors => theme.extension<ColorsScheme>()!;
}
