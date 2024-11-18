import 'package:dittobox_mobile/account_and_subscription/infrastructure/data_sources/account_service.dart';
import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/infrastructure/data_sources/facilities_service.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_worker_sheet.dart';
import 'package:dittobox_mobile/goups/presentation/worker-details/worker_details_screen.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:dittobox_mobile/user_and_profile/infrastructure/models/profile_model.dart';
import 'package:flutter/material.dart';

class WorkerListView extends StatefulWidget {
  const WorkerListView({super.key});

  @override
  _WorkerListViewState createState() => _WorkerListViewState();
}

class _WorkerListViewState extends State<WorkerListView> {
  late Future<List<Profile>> _profilesFuture;
  late Future<List<Map<String, dynamic>>> _groupsFuture;

  @override
  void initState() {
    super.initState();
    _profilesFuture = AccountService().getUsersByAccountId();
    _groupsFuture = AccountService().getGroups();
  }

  Future<void> _addWorker(String email, int groupId) async {
    try {
      await FacilitiesService().registerUserInGroup(groupId, email);
      setState(() {
        _profilesFuture = AccountService().getUsersByAccountId();
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(S.of(context).failedtoAddWorker)),
      );
      print('Failed to add worker: $e');
    }
  }

  Future<void> _refreshProfiles() async {
    setState(() {
      _profilesFuture = AccountService().getUsersByAccountId();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).workerList),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.workerlist),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _groupsFuture,
          builder: (context, groupSnapshot) {
            if (groupSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (groupSnapshot.hasError) {
              return Center(child: Text('Error: ${groupSnapshot.error}'));
            } else if (!groupSnapshot.hasData || groupSnapshot.data!.isEmpty) {
              return Center(child: Text(S.of(context).noFacilitiesFound));
            } else {
              final Map<int, String> groupMap = {
                for (var group in groupSnapshot.data!)
                  group['id'] as int: group['name'] as String
              };
              return FutureBuilder<List<Profile>>(
                future: _profilesFuture,
                builder: (context, profileSnapshot) {
                  if (profileSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (profileSnapshot.hasError) {
                    return Center(child: Text('Error: ${profileSnapshot.error}'));
                  } else if (!profileSnapshot.hasData || profileSnapshot.data!.isEmpty) {
                    return Center(child: Text(S.of(context).notUsersFound));
                  } else {
                    return WorkerList(profiles: profileSnapshot.data!, groupMap: groupMap, refreshProfiles: _refreshProfiles);
                  }
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddWorkerSheet(context, _addWorker);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WorkerList extends StatelessWidget {
  final List<Profile> profiles;
  final Map<int, String> groupMap;
  final Future<void> Function() refreshProfiles;

  const WorkerList({super.key, required this.profiles, required this.groupMap, required this.refreshProfiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index) {
        return WorkerItem(profile: profiles[index], groupName: groupMap[profiles[index].groupId] ?? S.of(context).noPoseefacility, refreshProfiles: refreshProfiles);
      },
    );
  }
}

class WorkerItem extends StatelessWidget {
  final Profile profile;
  final String groupName;
  final Future<void> Function() refreshProfiles;

  const WorkerItem({super.key, required this.profile, required this.groupName, required this.refreshProfiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(profile.firstName[0]),
          ),
          title: Text('${profile.firstName} ${profile.lastName}'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_getRoleTranslation(context, profile)),
              Text('${S.of(context).facility}: $groupName'),
            ],
          ),
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkerDetailScreen(worker: profile),
              ),
            );
            if (result == true) {
              await refreshProfiles();
            }
          },
        ),
        const Divider(),
      ],
    );
  }

  String _getRoleTranslation(BuildContext context, Profile profile) {
    if (_isOwner(profile)) {
      return S.of(context).owner;
    } else if (_isManager(profile)) {
      return S.of(context).manager;
    } else {
      return S.of(context).worker;
    }
  }

  bool _isOwner(Profile profile) {
    return profile.privileges.contains('WorkerManagement') &&
           profile.privileges.contains('GroupManagement') &&
           profile.privileges.contains('AccountManagement');
  }

  bool _isManager(Profile profile) {
    return profile.privileges.contains('WorkerManagement') ||
           profile.privileges.contains('GroupManagement') ||
           profile.privileges.contains('AccountManagement');
  }
}