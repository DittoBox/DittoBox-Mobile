import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatefulWidget {
  final String currentRoute;

  CustomNavigationDrawer({required this.currentRoute});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 380,
                height: 750, // Ajusta el ancho según tus necesidades
                child: NavigationDrawer(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                    _navigateTo(index);
                  },
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.home_work_outlined),
                      label: Text('Facilities'),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.widgets_outlined),
                      label: Text('Containers'),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.person_2_outlined),
                      label: Text('Workers'),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.text_snippet_outlined),
                      label: Text('Templates'),
                    ),
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Settings',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold  ),
                      ),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.account_circle),
                      label: Text('Account'),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.payment),
                      label: Text('Subscription'),
                    ),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.notifications_none),
                      label: Text('Notifications'),
                    ),
                    const Divider(),
                    NavigationDrawerDestination(
                      icon: Icon(Icons.logout),
                      label: Text('Log out'),
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

  void _navigateTo(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(AppRoutes.facilities);
        break;
      case 1:
        Navigator.of(context).pushNamed('/containers');
        break;
      case 2:
        Navigator.of(context).pushNamed('/workers');
        break;
      case 3:
        Navigator.of(context).pushNamed('/templates');
        break;
      case 5:
        Navigator.of(context).pushNamed('/account');
        break;
      case 6:
        Navigator.of(context).pushNamed('/subscription');
        break;
      case 7:
        Navigator.of(context).pushNamed('/notifications');
        break;
      case 9:
        // Lógica para cerrar sesión
        break;
    }
  }
}