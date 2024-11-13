import 'location.dart';

// Facility Model
class Facility {
  final int id;
  final String title;
  final Location location;
  final int accountId;
  final int facilityType;

  Facility({
    required this.id,
    required this.title,
    required this.location,
    required this.accountId,
    required this.facilityType,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      title: json['name'],
      location: Location.fromJson(json['location']),
      accountId: json['accountId'],
      facilityType: json['facilityType'],
    );
  }
}