import 'package:dittobox_mobile/goups/infrastructure/models/location.dart';

class Facility {
  final int id;
  final String title;
  final Location location;
  final int accountId;
  final int facilityType;
  final int containerCount; // Nueva propiedad
  final int profileCount; // Nueva propiedad

  Facility({
    required this.id,
    required this.title,
    required this.location,
    required this.accountId,
    required this.facilityType,
    required this.containerCount, // Nueva propiedad
    required this.profileCount, // Nueva propiedad
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    print('containerCount: ${json['containerCount']}'); // Agrega esta línea para depurar
    print('profileCount: ${json['profileCount']}'); // Agrega esta línea para depurar
    return Facility(
      id: json['id'],
      title: json['name'],
      location: Location.fromJson(json['location']),
      accountId: json['accountId'],
      facilityType: json['facilityType'],
      containerCount: json['containerCount'] ?? 0, // Manejo de null
      profileCount: json['profileCount'] ?? 0, // Manejo de null
    );
  }
}