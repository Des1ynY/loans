// ignore_for_file: annotate_overrides

part of '../theme.dart';

@tailorMixin
final class TextScheme extends ThemeExtension<TextScheme> with _$TextSchemeTailorMixin {
  final HeadersScheme headers;
  final ParagraphScheme paragraphs;

  const TextScheme({
    required this.headers,
    required this.paragraphs,
  });
}

@tailorMixinComponent
final class HeadersScheme extends ThemeExtension<HeadersScheme> with _$HeadersSchemeTailorMixin {
  final TextStyle displayLarge;
  final TextStyle display;

  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;

  const HeadersScheme({
    required this.displayLarge,
    required this.display,
    required this.h1,
    required this.h2,
    required this.h3,
  });
}

@tailorMixinComponent
final class ParagraphScheme extends ThemeExtension<ParagraphScheme>
    with _$ParagraphSchemeTailorMixin {
  final TextStyle xl;
  final TextStyle l;

  final TextStyle m;
  final TextStyle mSemiBold;

  final TextStyle s;
  final TextStyle sSemiBold;

  final TextStyle xs;

  const ParagraphScheme({
    required this.xl,
    required this.l,
    required this.m,
    required this.mSemiBold,
    required this.s,
    required this.sSemiBold,
    required this.xs,
  });
}

const $MainFontFamily = 'Inter';
const $MainTextScheme = TextScheme(
  headers: HeadersScheme(
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w800,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.3,
      height: 1,
    ),
    display: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.3,
      height: 1,
    ),
    h1: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.3,
      height: 34 / 32,
    ),
    h2: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.3,
      height: 28 / 24,
    ),
    h3: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.3,
      height: 24 / 20,
    ),
  ),
  paragraphs: ParagraphScheme(
    xl: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 28 / 24,
    ),
    l: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 26 / 20,
    ),
    m: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 20 / 16,
    ),
    mSemiBold: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 1.25,
    ),
    s: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 18 / 14,
    ),
    sSemiBold: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: $MainFontFamily,
      letterSpacing: -0.2,
      height: 18 / 14,
    ),
    xs: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: $MainFontFamily,
      height: 14 / 10,
    ),
  ),
);
