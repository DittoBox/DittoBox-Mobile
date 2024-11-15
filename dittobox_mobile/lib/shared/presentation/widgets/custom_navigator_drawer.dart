import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/language-screen/language_selection_screen.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/data_sources/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavigationDrawer extends StatefulWidget {
  final String currentRoute;

  const CustomNavigationDrawer({super.key, required this.currentRoute});

  @override
  // ignore: library_private_types_in_public_api
  _CustomNavigationDrawerState createState() => _CustomNavigationDrawerState();
}

class _CustomNavigationDrawerState extends State<CustomNavigationDrawer> {
  bool hasWorkerManagementPrivilege = false;
  bool hasGroupManagementPrivilege = false;
  bool hasAccountManagementPrivilege = false;

  @override
  void initState() {
    super.initState();
    _loadPrivileges();
  }

  Future<void> _loadPrivileges() async {
    final prefs =  SharedPreferencesAsync();
    final workerPrivilege = await prefs.getBool('hasWorkerManagementPrivilege') ?? false;
    final groupPrivilege = await prefs.getBool('hasGroupManagementPrivilege') ?? false;
    final accountPrivilege = await prefs.getBool('hasAccountManagementPrivilege') ?? false;

    print('Worker Management Privilege: $workerPrivilege');
    print('Group Management Privilege: $groupPrivilege');
    print('Account Management Privilege: $accountPrivilege');

    setState(() {
      hasWorkerManagementPrivilege = workerPrivilege;
      hasGroupManagementPrivilege = groupPrivilege;
      hasAccountManagementPrivilege = accountPrivilege;
    });
  }

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
                  onDestinationSelected: (int index) async {
                    if (index == _buildDrawerItems().length - 1) {
                      await _logout();
                    } else {
                      _navigateTo(_getRouteFromIndex(index));
                    }
                  },
                  children: _buildDrawerItems(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    if (hasGroupManagementPrivilege && hasWorkerManagementPrivilege && hasAccountManagementPrivilege) {
      return _buildDrawerItemsAllPrivileges();
    } else if (hasGroupManagementPrivilege || hasWorkerManagementPrivilege || hasAccountManagementPrivilege) {
      return _buildDrawerItemsSomePrivileges();
    } else {
      return _buildDrawerItemsNoPrivileges();
    }
  }

  List<Widget> _buildDrawerItemsAllPrivileges() {
    return [
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
    ];
  }

  List<Widget> _buildDrawerItemsSomePrivileges() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          S.of(context).menu,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      if (hasGroupManagementPrivilege || hasWorkerManagementPrivilege || hasAccountManagementPrivilege)
        NavigationDrawerDestination(
          icon: const Icon(Icons.home_work_outlined),
          label: Text(S.of(context).facilities),
        ),
      NavigationDrawerDestination(
        icon: const Icon(Icons.widgets_outlined),
        label: Text(S.of(context).containers),
      ),
      if (hasWorkerManagementPrivilege)
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
      if (hasAccountManagementPrivilege)
        NavigationDrawerDestination(
          icon: const Icon(Icons.account_circle),
          label: Text(S.of(context).account),
        ),
      if (hasGroupManagementPrivilege)
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
    ];
  }

  List<Widget> _buildDrawerItemsNoPrivileges() {
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          S.of(context).menu,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      NavigationDrawerDestination(
        icon: const Icon(Icons.widgets_outlined),
        label: Text(S.of(context).containers),
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
    ];
  }

  int _getSelectedIndex() {
    int index = 0;
    if (hasGroupManagementPrivilege || hasWorkerManagementPrivilege || hasAccountManagementPrivilege) {
      if (widget.currentRoute == AppRoutes.facilities) {
        return index;
      }
      index++;
    }
    if (widget.currentRoute == AppRoutes.containers) {
      return index;
    }
    index++;
    if (hasWorkerManagementPrivilege) {
      if (widget.currentRoute == AppRoutes.workerlist) {
        return index;
      }
      index++;
    }
    if (widget.currentRoute == AppRoutes.templates) {
      return index;
    }
    index++;
    if (hasAccountManagementPrivilege) {
      if (widget.currentRoute == AppRoutes.accountDetails) {
        return index;
      }
      index++;
    }
    if (hasGroupManagementPrivilege) {
      if (widget.currentRoute == AppRoutes.subscriptionDetails) {
        return index;
      }
      index++;
    }
    if (widget.currentRoute == '/notifications') {
      return index;
    }
    index++;
    if (widget.currentRoute == '/language-selection') {
      return index;
    }
    return -1;
  }

  String _getRouteFromIndex(int index) {
    List<String> routes = [];
    if (hasGroupManagementPrivilege || hasWorkerManagementPrivilege || hasAccountManagementPrivilege) {
      routes.add(AppRoutes.facilities);
    }
    routes.add(AppRoutes.containers);
    if (hasWorkerManagementPrivilege) {
      routes.add(AppRoutes.workerlist);
    }
    routes.add(AppRoutes.templates);
    if (hasAccountManagementPrivilege) {
      routes.add(AppRoutes.accountDetails);
    }
    if (hasGroupManagementPrivilege) {
      routes.add(AppRoutes.subscriptionDetails);
    }
    routes.add('/notifications');
    routes.add('/language-selection');
    routes.add(AppRoutes.login); // Ruta para logout

    return routes[index];
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

  Future<void> _logout() async {
    await UserService().logoutUser();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
  }
}