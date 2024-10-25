import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/main.dart'; // Importa el archivo donde está definido MainApp

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  late Locale _selectedLocale;
  bool _isChangingLanguage = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLocale = Localizations.localeOf(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).selectLanguage),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ListTile(
                title: Text(S.of(context).english),
                trailing: _selectedLocale == const Locale('en')
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  _changeLanguage(context, const Locale('en'));
                },
              ),
              ListTile(
                title: Text(S.of(context).spanish),
                trailing: _selectedLocale == const Locale('es')
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  _changeLanguage(context, const Locale('es'));
                },
              ),
            ],
          ),
          if (_isChangingLanguage)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) async {
  setState(() {
    _isChangingLanguage = true;
  });

  await Future.delayed(const Duration(seconds: 1)); // Simula un retraso para el cambio de idioma

  setState(() {
    _selectedLocale = locale;
    _isChangingLanguage = false;
  });

  MainApp.setLocale(context, locale);
  print('Idioma cambiado a: ${locale.languageCode}'); // Agrega esta línea para verificar el cambio de idioma
  Navigator.of(context).pop();
}
}