import "package:flutter/material.dart";

class DittoBoxTheme {
  final TextTheme textTheme;

  const DittoBoxTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2b593c),
      surfaceTint: Color(0xff3a684a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff507f5f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff506354),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd7ecd9),
      onSecondaryContainer: Color(0xff3d4f41),
      tertiary: Color(0xff2a5472),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff517998),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff9faf5),
      onSurface: Color(0xff1a1c1a),
      onSurfaceVariant: Color(0xff414942),
      outline: Color(0xff717971),
      outlineVariant: Color(0xffc1c9c0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312e),
      inversePrimary: Color(0xffa0d2ad),
      primaryFixed: Color(0xffbcefc8),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xffa0d2ad),
      onPrimaryFixedVariant: Color(0xff224f33),
      secondaryFixed: Color(0xffd3e8d5),
      onSecondaryFixed: Color(0xff0e1f14),
      secondaryFixedDim: Color(0xffb7ccba),
      onSecondaryFixedVariant: Color(0xff394b3d),
      tertiaryFixed: Color(0xffcae6ff),
      onTertiaryFixed: Color(0xff001e30),
      tertiaryFixedDim: Color(0xffa3cbee),
      onTertiaryFixedVariant: Color(0xff1f4a68),
      surfaceDim: Color(0xffd9dad6),
      surfaceBright: Color(0xfff9faf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4ef),
      surfaceContainer: Color(0xffedeeea),
      surfaceContainerHigh: Color(0xffe7e9e4),
      surfaceContainerHighest: Color(0xffe2e3de),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1d4b30),
      surfaceTint: Color(0xff3a684a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff507f5f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff35473a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff66796a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1a4663),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff517998),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9faf5),
      onSurface: Color(0xff1a1c1a),
      onSurfaceVariant: Color(0xff3d453e),
      outline: Color(0xff59615a),
      outlineVariant: Color(0xff757d75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312e),
      inversePrimary: Color(0xffa0d2ad),
      primaryFixed: Color(0xff507f5f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff386547),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff66796a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4e6052),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff517998),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff37607e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9dad6),
      surfaceBright: Color(0xfff9faf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4ef),
      surfaceContainer: Color(0xffedeeea),
      surfaceContainerHigh: Color(0xffe7e9e4),
      surfaceContainerHighest: Color(0xffe2e3de),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002913),
      surfaceTint: Color(0xff3a684a),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1d4b30),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff15261a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff35473a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00253a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1a4663),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9faf5),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1e2620),
      outline: Color(0xff3d453e),
      outlineVariant: Color(0xff3d453e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e312e),
      inversePrimary: Color(0xffc5f8d1),
      primaryFixed: Color(0xff1d4b30),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff02341b),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff35473a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1f3124),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1a4663),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff00304a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9dad6),
      surfaceBright: Color(0xfff9faf5),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f4ef),
      surfaceContainer: Color(0xffedeeea),
      surfaceContainerHigh: Color(0xffe7e9e4),
      surfaceContainerHighest: Color(0xffe2e3de),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa0d2ad),
      surfaceTint: Color(0xffa0d2ad),
      onPrimary: Color(0xff06381e),
      primaryContainer: Color(0xff507f5f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffb7ccba),
      onSecondary: Color(0xff233428),
      secondaryContainer: Color(0xff304134),
      onSecondaryContainer: Color(0xffc2d6c4),
      tertiary: Color(0xffa3cbee),
      onTertiary: Color(0xff00344f),
      tertiaryContainer: Color(0xff517998),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111412),
      onSurface: Color(0xffe2e3de),
      onSurfaceVariant: Color(0xffc1c9c0),
      outline: Color(0xff8b938b),
      outlineVariant: Color(0xff414942),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3de),
      inversePrimary: Color(0xff3a684a),
      primaryFixed: Color(0xffbcefc8),
      onPrimaryFixed: Color(0xff00210f),
      primaryFixedDim: Color(0xffa0d2ad),
      onPrimaryFixedVariant: Color(0xff224f33),
      secondaryFixed: Color(0xffd3e8d5),
      onSecondaryFixed: Color(0xff0e1f14),
      secondaryFixedDim: Color(0xffb7ccba),
      onSecondaryFixedVariant: Color(0xff394b3d),
      tertiaryFixed: Color(0xffcae6ff),
      onTertiaryFixed: Color(0xff001e30),
      tertiaryFixedDim: Color(0xffa3cbee),
      onTertiaryFixedVariant: Color(0xff1f4a68),
      surfaceDim: Color(0xff111412),
      surfaceBright: Color(0xff373a37),
      surfaceContainerLowest: Color(0xff0c0f0c),
      surfaceContainerLow: Color(0xff1a1c1a),
      surfaceContainer: Color(0xff1e201e),
      surfaceContainerHigh: Color(0xff282b28),
      surfaceContainerHighest: Color(0xff333532),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa5d6b1),
      surfaceTint: Color(0xffa0d2ad),
      onPrimary: Color(0xff001b0b),
      primaryContainer: Color(0xff6c9b79),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbcd0be),
      onSecondary: Color(0xff091a0f),
      secondaryContainer: Color(0xff829685),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa7cff2),
      onTertiary: Color(0xff001828),
      tertiaryContainer: Color(0xff6d95b6),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111412),
      onSurface: Color(0xfffafbf6),
      onSurfaceVariant: Color(0xffc5cdc4),
      outline: Color(0xff9da59c),
      outlineVariant: Color(0xff7d857d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3de),
      inversePrimary: Color(0xff235134),
      primaryFixed: Color(0xffbcefc8),
      onPrimaryFixed: Color(0xff001508),
      primaryFixedDim: Color(0xffa0d2ad),
      onPrimaryFixedVariant: Color(0xff0e3e24),
      secondaryFixed: Color(0xffd3e8d5),
      onSecondaryFixed: Color(0xff04140a),
      secondaryFixedDim: Color(0xffb7ccba),
      onSecondaryFixedVariant: Color(0xff293a2d),
      tertiaryFixed: Color(0xffcae6ff),
      onTertiaryFixed: Color(0xff001320),
      tertiaryFixedDim: Color(0xffa3cbee),
      onTertiaryFixedVariant: Color(0xff073a56),
      surfaceDim: Color(0xff111412),
      surfaceBright: Color(0xff373a37),
      surfaceContainerLowest: Color(0xff0c0f0c),
      surfaceContainerLow: Color(0xff1a1c1a),
      surfaceContainer: Color(0xff1e201e),
      surfaceContainerHigh: Color(0xff282b28),
      surfaceContainerHighest: Color(0xff333532),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffefffef),
      surfaceTint: Color(0xffa0d2ad),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa5d6b1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffefffef),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbcd0be),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff9fbff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa7cff2),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111412),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff5fdf3),
      outline: Color(0xffc5cdc4),
      outlineVariant: Color(0xffc5cdc4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe2e3de),
      inversePrimary: Color(0xff003119),
      primaryFixed: Color(0xffc0f3cc),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa5d6b1),
      onPrimaryFixedVariant: Color(0xff001b0b),
      secondaryFixed: Color(0xffd7ecda),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbcd0be),
      onSecondaryFixedVariant: Color(0xff091a0f),
      tertiaryFixed: Color(0xffd3eaff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa7cff2),
      onTertiaryFixedVariant: Color(0xff001828),
      surfaceDim: Color(0xff111412),
      surfaceBright: Color(0xff373a37),
      surfaceContainerLowest: Color(0xff0c0f0c),
      surfaceContainerLow: Color(0xff1a1c1a),
      surfaceContainer: Color(0xff1e201e),
      surfaceContainerHigh: Color(0xff282b28),
      surfaceContainerHighest: Color(0xff333532),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
