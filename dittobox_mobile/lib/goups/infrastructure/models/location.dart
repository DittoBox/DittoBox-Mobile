class Location {
  final int? id;
  final double? latitude;
  final double? longitude;
  final String? plusCode;
  final String? country;
  final String? state;
  final String? city;
  final String? address;

  Location({
    this.id,
    this.latitude,
    this.longitude,
    this.plusCode,
    this.country,
    this.state,
    this.city,
    this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'latitude': latitude ?? 0,
      'longitude': longitude ?? 0,
      'plusCode': plusCode ?? "",
      'country': country ?? "",
      'state': state ?? "",
      'city': city ?? "",
      'address': address ?? "",
    };
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      plusCode: json['plusCode'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      address: json['address'],
    );
  }
}