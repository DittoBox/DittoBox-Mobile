import "package:flutter/material.dart";

class DittoBoxTheme {
  final TextTheme textTheme;

  const DittoBoxTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281030972),
      surfaceTint: Color(4282017866),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283465567),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283458388),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292340953),
      onSecondaryContainer: Color(4282208065),
      tertiary: Color(4280964210),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283529624),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294572789),
      onSurface: Color(4279901210),
      onSurfaceVariant: Color(4282468674),
      outline: Color(4285626737),
      outlineVariant: Color(4290890176),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217326),
      inversePrimary: Color(4288729773),
      primaryFixed: Color(4290572232),
      onPrimaryFixed: Color(4278198543),
      primaryFixedDim: Color(4288729773),
      onPrimaryFixedVariant: Color(4280438579),
      secondaryFixed: Color(4292077781),
      onSecondaryFixed: Color(4279115540),
      secondaryFixedDim: Color(4290235578),
      onSecondaryFixedVariant: Color(4281944893),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4288924654),
      onTertiaryFixedVariant: Color(4280240744),
      surfaceDim: Color(4292467414),
      surfaceBright: Color(4294572789),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178031),
      surfaceContainer: Color(4293783274),
      surfaceContainerHigh: Color(4293388772),
      surfaceContainerHighest: Color(4293059550),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280109872),
      surfaceTint: Color(4282017866),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283465567),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281681722),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284905834),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279912035),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283529624),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572789),
      onSurface: Color(4279901210),
      onSurfaceVariant: Color(4282205502),
      outline: Color(4284047706),
      outlineVariant: Color(4285889909),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217326),
      inversePrimary: Color(4288729773),
      primaryFixed: Color(4283465567),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281886023),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284905834),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283326546),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283529624),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281819262),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467414),
      surfaceBright: Color(4294572789),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178031),
      surfaceContainer: Color(4293783274),
      surfaceContainerHigh: Color(4293388772),
      surfaceContainerHighest: Color(4293059550),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200595),
      surfaceTint: Color(4282017866),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280109872),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279576090),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281681722),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199610),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4279912035),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294572789),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280165920),
      outline: Color(4282205502),
      outlineVariant: Color(4282205502),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217326),
      inversePrimary: Color(4291164369),
      primaryFixed: Color(4280109872),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278334491),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281681722),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280234276),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4279912035),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202442),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467414),
      surfaceBright: Color(4294572789),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294178031),
      surfaceContainer: Color(4293783274),
      surfaceContainerHigh: Color(4293388772),
      surfaceContainerHighest: Color(4293059550),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288729773),
      surfaceTint: Color(4288729773),
      onPrimary: Color(4278597662),
      primaryContainer: Color(4283465567),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4290235578),
      onSecondary: Color(4280497192),
      secondaryContainer: Color(4281352500),
      onSecondaryContainer: Color(4290959044),
      tertiary: Color(4288924654),
      onTertiary: Color(4278203471),
      tertiaryContainer: Color(4283529624),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279309330),
      onSurface: Color(4293059550),
      onSurfaceVariant: Color(4290890176),
      outline: Color(4287337355),
      outlineVariant: Color(4282468674),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059550),
      inversePrimary: Color(4282017866),
      primaryFixed: Color(4290572232),
      onPrimaryFixed: Color(4278198543),
      primaryFixedDim: Color(4288729773),
      onPrimaryFixedVariant: Color(4280438579),
      secondaryFixed: Color(4292077781),
      onSecondaryFixed: Color(4279115540),
      secondaryFixedDim: Color(4290235578),
      onSecondaryFixedVariant: Color(4281944893),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4288924654),
      onTertiaryFixedVariant: Color(4280240744),
      surfaceDim: Color(4279309330),
      surfaceBright: Color(4281809463),
      surfaceContainerLowest: Color(4278980364),
      surfaceContainerLow: Color(4279901210),
      surfaceContainer: Color(4280164382),
      surfaceContainerHigh: Color(4280822568),
      surfaceContainerHighest: Color(4281546034),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289058481),
      surfaceTint: Color(4288729773),
      onPrimary: Color(4278197003),
      primaryContainer: Color(4285307769),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290564286),
      onSecondary: Color(4278786575),
      secondaryContainer: Color(4286748293),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289187826),
      onTertiary: Color(4278196264),
      tertiaryContainer: Color(4285371830),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309330),
      onSurface: Color(4294638582),
      onSurfaceVariant: Color(4291153348),
      outline: Color(4288521628),
      outlineVariant: Color(4286416253),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059550),
      inversePrimary: Color(4280504628),
      primaryFixed: Color(4290572232),
      onPrimaryFixed: Color(4278195464),
      primaryFixedDim: Color(4288729773),
      onPrimaryFixedVariant: Color(4279123492),
      secondaryFixed: Color(4292077781),
      onSecondaryFixed: Color(4278457354),
      secondaryFixedDim: Color(4290235578),
      onSecondaryFixedVariant: Color(4280891949),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278194976),
      tertiaryFixedDim: Color(4288924654),
      onTertiaryFixedVariant: Color(4278663766),
      surfaceDim: Color(4279309330),
      surfaceBright: Color(4281809463),
      surfaceContainerLowest: Color(4278980364),
      surfaceContainerLow: Color(4279901210),
      surfaceContainer: Color(4280164382),
      surfaceContainerHigh: Color(4280822568),
      surfaceContainerHighest: Color(4281546034),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293918703),
      surfaceTint: Color(4288729773),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289058481),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293918703),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290564286),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294573055),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289187826),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309330),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294311411),
      outline: Color(4291153348),
      outlineVariant: Color(4291153348),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293059550),
      inversePrimary: Color(4278202649),
      primaryFixed: Color(4290835404),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289058481),
      onPrimaryFixedVariant: Color(4278197003),
      secondaryFixed: Color(4292340954),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290564286),
      onSecondaryFixedVariant: Color(4278786575),
      tertiaryFixed: Color(4292078335),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289187826),
      onTertiaryFixedVariant: Color(4278196264),
      surfaceDim: Color(4279309330),
      surfaceBright: Color(4281809463),
      surfaceContainerLowest: Color(4278980364),
      surfaceContainerLow: Color(4279901210),
      surfaceContainer: Color(4280164382),
      surfaceContainerHigh: Color(4280822568),
      surfaceContainerHighest: Color(4281546034),
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
     scaffoldBackgroundColor: colorScheme.background,
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
