class Template {
  final String name;
  final String description;
  final String category; // Produce, Meats, Animal derived, Processed Food
  final double tempMin;
  final double tempMax;
  final double humidityMin;
  final double humidityMax;
  final double? oxygen;
  final double? carbonDioxide;
  final double? ethylene;
  final double? ammonia;
  final double? sulfurDioxide;

  Template({
    required this.name,
    required this.description,
    required this.category,
    required this.tempMin,
    required this.tempMax,
    required this.humidityMin,
    required this.humidityMax,
    this.oxygen,
    this.carbonDioxide,
    this.ethylene,
    this.ammonia,
    this.sulfurDioxide,
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    return Template(
      name: json['name'],
      description: json['description'],
      category: json['category'],
      tempMin: json['tempMin'],
      tempMax: json['tempMax'],
      humidityMin: json['humidityMin'],
      humidityMax: json['humidityMax'],
      oxygen: json['oxygen'],
      carbonDioxide: json['carbonDioxide'],
      ethylene: json['ethylene'],
      ammonia: json['ammonia'],
      sulfurDioxide: json['sulfurDioxide'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'humidityMin': humidityMin,
      'humidityMax': humidityMax,
      'oxygen': oxygen,
      'carbonDioxide': carbonDioxide,
      'ethylene': ethylene,
      'ammonia': ammonia,
      'sulfurDioxide': sulfurDioxide,
    };
  }
}