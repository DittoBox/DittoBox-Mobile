import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/language-screen/language_selection_screen.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatefulWidget {
  final String currentRoute;

  const CustomNavigationDrawer({super.key, required this.currentRoute});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {


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
                    NavigationDrawerDestination(
                      icon: const Icon(Icons.language),
                      label: Text(S.of(context).language),
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
      case '/language-selection':
        return 7;
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
      case 7:
        return '/language-selection';
      default:
        return '';
    }
  }

  void _navigateTo(String route) {
    if (route == '/language-selection') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LanguageSelectionScreen(),
        ),
      );
    } else if (route.isNotEmpty) {
      Navigator.of(context).pushNamed(route);
    }
  }
}