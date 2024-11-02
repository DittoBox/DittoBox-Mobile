import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './styles/dittobox_theme.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MainAppState state = context.findAncestorStateOfType<_MainAppState>()!;
    state.setLocale(newLocale);
  }

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  final textTheme = GoogleFonts.poppinsTextTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DittoBox',
      initialRoute: AppRoutes.templates,
      debugShowCheckedModeBanner: false,
      theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? DittoBoxTheme(textTheme).dark()
          : DittoBoxTheme(textTheme).light(),
      routes: appRoutes,
      locale: _locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}