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
                child: NavigationDrawer(
                  selectedIndex: _getSelectedIndex(),
                  onDestinationSelected: (int index) {
                    _navigateTo(_getRouteFromIndex(index));
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        S.of(context).menu,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.home_work_outlined),
                      label: Text(S.of(context).facilities),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.widgets_outlined),
                      label: Text(S.of(context).containers),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.person_2_outlined),
                      label: Text(S.of(context).workers),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.text_snippet_outlined),
                      label: Text(S.of(context).templates),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        S.of(context).settings,
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.account_circle),
                      label: Text(S.of(context).account),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.payment),
                      label: Text(S.of(context).subscription),
                    ),
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.notifications_none),
                      label: Text(S.of(context).notifications),
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
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.logout),
                      label: Text(S.of(context).logOut),
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

  int _getSelectedIndex() {
    switch (widget.currentRoute) {
      case AppRoutes.facilities:
        return 0;
      case '/containers':
        return 1;
      case '/workers':
        return 2;
      case AppRoutes.templates:
        return 3;
      case '/account':
        return 4;
      case '/subscription':
        return 5;
      case '/notifications':
        return 6;
      default:
        return -1;
    }
  }

  String _getRouteFromIndex(int index) {
    switch (index) {
      case 0:
        return AppRoutes.facilities;
      case 1:
        return '/containers';
      case 2:
        return '/workers';
      case 3:
        return AppRoutes.templates;
      case 4:
        return '/account';
      case 5:
        return '/subscription';
      case 6:
        return '/notifications';
      default:
        return '';
    }
  }

  void _navigateTo(String route) {
    if (route.isNotEmpty) {
      Navigator.of(context).pushNamed(route);
    }
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