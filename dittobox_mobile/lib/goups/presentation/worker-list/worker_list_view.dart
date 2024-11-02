import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/goups/presentation/widgets/add_worker_sheet.dart';
import 'package:dittobox_mobile/goups/presentation/worker-details/worker_details_screen.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

class WorkerListView extends StatelessWidget {
  const WorkerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).workerList),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.workerlist),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: WorkerList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddWorkerSheet(context, null); // Pasa null como instalación
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WorkerList extends StatelessWidget {
  WorkerList({super.key});

  final List<User> workers = [
    User(name: 'Candice Merle', role: 'Manager', location: 'Restaurante A'),
    User(name: 'Andrea Kirsch', role: 'Worker', location: 'Restaurante A'),
    User(name: 'Angelo Fray', role: 'Manager', location: 'Restaurante A'),
    User(name: 'Manuel Ruiz', role: 'Manager', location: 'Restaurante A'),
    User(name: 'Ivonne Black', role: 'Manager', location: 'Restaurante A'),
    User(name: 'Alexander Smith', role: 'Manager', location: 'Restaurante A'),
    User(name: 'Troy Willfort', role: 'Worker', location: 'Restaurante A'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: workers.map((worker) => WorkerItem(
        user: worker,
      )).toList(),
    );
  }
}

class WorkerItem extends StatelessWidget {
  final User user;

  const WorkerItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(
              user.name[0],
            ),
          ),
          title: Text(user.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.role),
              Text(user.location),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WorkerDetailScreen(worker: user),
              ),
            );
          },
        ),
        const Divider(),
      ],
    );
  }
}