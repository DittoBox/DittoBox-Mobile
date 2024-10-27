// Facility Model
class Facility {
  final String title;
  final String location;
  final int containers;
  final int alerts;
  final int workers;
  final String type; // Nueva propiedad

  Facility({
    required this.title,
    required this.location,
    required this.containers,
    required this.alerts,
    required this.workers,
    required this.type, // Nuevo parámetro
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      title: json['title'],
      location: json['location'],
      containers: json['containers'],
      alerts: json['alerts'],
      workers: json['workers'],
      type: json['type'], // Nuevo campo
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'location': location,
      'containers': containers,
      'alerts': alerts,
      'workers': workers,
      'type': type, // Nuevo campo
    };
  }
}