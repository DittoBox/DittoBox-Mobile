import 'package:dittobox_mobile/generated/l10n.dart';
import 'package:dittobox_mobile/routes/app_routes.dart';
import 'package:dittobox_mobile/shared/presentation/widgets/custom_navigator_drawer.dart';
import 'package:flutter/material.dart';
import 'package:dittobox_mobile/shared/services/flutter_notification_services.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [];
  bool _isLoading = true; // Añadir variable de estado de carga

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      List<Map<String, dynamic>> fetchedNotifications = await fetchAccountNotifications(context);
      setState(() {
        notifications = fetchedNotifications;
        _isLoading = false; // Actualizar estado de carga
      });
    } catch (e) {
      setState(() {
        _isLoading = false; // Actualizar estado de carga
      });
      // Manejo de errores
      print('Error al obtener notificaciones: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).notifications),
      ),
      drawer: const CustomNavigationDrawer(currentRoute: AppRoutes.notifications),
      body: _isLoading
          ? Center(child: CircularProgressIndicator()) // Mostrar indicador de progreso
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                String formattedTime = DateFormat('dd-MM-yyyy HH:mm').format(DateTime.parse(notification["time"]).toUtc().subtract(const Duration(hours: 5)));
                print('Formatted time: $formattedTime'); // Agregar print para verificar el formato
                print('Notification description: ${notification["description"]}');
                return Dismissible(
                  key: Key(notification["title"]!),
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.visibility, color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      // Acción de ver detalles
                    } else {
                      // Acción de descartar
                    }
                  },
                  child: Card.outlined(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                      title: Text(
                        notification["title"] ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(formattedTime), // Usar formattedTime aquí
                          const SizedBox(height: 4),
                          if (notification["description"] != null)
                            Text(notification["description"] ?? ""),
                          const SizedBox(height: 8),
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