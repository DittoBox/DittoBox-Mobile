import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/main.dart'; // Importa el archivo donde está definido MainApp

class CustomNavigationDrawer extends StatefulWidget {
  final String currentRoute;

  const CustomNavigationDrawer({super.key, required this.currentRoute});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  int _selectedIndex = 0;
  Locale _locale = const Locale('en');
  bool _isChangingLanguage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 380,
                height: 750, // Ajusta el ancho según tus necesidades
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        S.of(context).menu,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.home_work_outlined),
                      title: Text(S.of(context).facilities),
                      onTap: () => _navigateTo(AppRoutes.facilities),
                    ),
                    ListTile(
                      leading: const Icon(Icons.widgets_outlined),
                      title: Text(S.of(context).containers),
                      onTap: () => _navigateTo('/containers'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_2_outlined),
                      title: Text(S.of(context).workers),
                      onTap: () => _navigateTo('/workers'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.text_snippet_outlined),
                      title: Text(S.of(context).templates),
                      onTap: () => _navigateTo('/templates'),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        S.of(context).settings,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(S.of(context).account),
                      onTap: () => _navigateTo('/account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.payment),
                      title: Text(S.of(context).subscription),
                      onTap: () => _navigateTo('/subscription'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.notifications_none),
                      title: Text(S.of(context).notifications),
                      onTap: () => _navigateTo('/notifications'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_locale.languageCode == 'en' ? S.of(context).changeToSpanish : S.of(context).changeToEnglish),
                          if (_isChangingLanguage)
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                        ],
                      ),
                      onTap: _isChangingLanguage ? null : _changeLanguage,
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(S.of(context).logOut),
                      onTap: () {
                        // Lógica para cerrar sesión
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(String route) {
    Navigator.of(context).pushNamed(route);
  }

  void _changeLanguage() {
    setState(() {
      _isChangingLanguage = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _locale = _locale.languageCode == 'en' ? const Locale('es') : const Locale('en');
        MainApp.setLocale(context, _locale);
        _isChangingLanguage = false;
      });
    });
  }
}