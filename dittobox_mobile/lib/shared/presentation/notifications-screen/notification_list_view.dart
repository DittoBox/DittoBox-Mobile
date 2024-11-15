import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> notifications = [
    {
      "time": "10/22/24, 8:30 AM",
      "title": "Critical Alert",
      "description": "A serious problem has been detected in the system.",
      "viewAction": "View Details",
      "dismissAction": "Dismiss",
    },
    {
      "time": "10/22/24, 8:30 AM",
      "title": "Maintenance Warning",
      "description": "The system requires maintenance within the next 24 hours.",
      "viewAction": "View Details",
      "dismissAction": "Dismiss",
    },
    {
      "time": "10/22/24, 8:30 AM",
      "title": "Update Available",
      "description": "Version 1.3.0 is ready to install.",
      "dismissAction": "Dismiss",
    },
    {
      "time": "10/22/24, 8:30 AM",
      "title": "Unauthorized Access",
      "description": "A suspicious login attempt was detected.",
      "viewAction": "View Details",
      "dismissAction": "Dismiss",
    },
    {
      "time": "10/22/24, 8:30 AM",
      "title": "Low Battery",
      "description": "The device battery level is below 10%.",
      "dismissAction": "Dismiss",
    },
    {
      "time": "10/22/24, 8:30 AM",
      "title": "System Update",
      "description": "The system will automatically update within the next hour.",
      "dismissAction": "Dismiss",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.notifications),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Dismissible(
            key: Key(notification["title"]!),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.visibility, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                // Acción de ver detalles
              } else {
                // Acción de descartar
              }
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.info, color: Colors.white),
                ),
                title: Text(
                  notification["title"] ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification["time"] ?? ""),
                    SizedBox(height: 4),
                    Text(notification["description"] ?? ""),
                    SizedBox(height: 8), // Espacio adicional para separar el texto de los botones
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (notification.containsKey("viewAction"))
                          TextButton(
                            onPressed: () {
                              // Acción de ver detalles
                            },
                            child: Text(
                              notification["viewAction"]!,
                              style: TextStyle(color: Colors.green, fontSize: 12), // Tamaño de fuente reducido
                            ),
                          ),
                        TextButton(
                          onPressed: () {
                            // Acción de descartar
                          },
                          child: Text(
                            notification["dismissAction"]!,
                            style: TextStyle(color: Colors.red, fontSize: 12), // Tamaño de fuente reducido
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}