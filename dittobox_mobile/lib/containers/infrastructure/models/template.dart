class Template {
  final String name;
  final String description;
  final String category; // Produce, Meats, Animal derived, Processed Food
  final double tempMin;
  final double tempMax;
  final double humidityMin;
  final double humidityMax;
  final double? oxygenMin;
  final double? oxygenMax;
  final double? carbonDioxideMin;
  final double? carbonDioxideMax;
  final double? ethyleneMin;
  final double? ethyleneMax;
  final double? ammoniaMin;
  final double? ammoniaMax;
  final double? sulfurDioxideMin;
  final double? sulfurDioxideMax;

  Template({
    required this.name,
    required this.description,
    required this.category,
    required this.tempMin,
    required this.tempMax,
    required this.humidityMin,
    required this.humidityMax,
    this.oxygenMin,
    this.oxygenMax,
    this.carbonDioxideMin,
    this.carbonDioxideMax,
    this.ethyleneMin,
    this.ethyleneMax,
    this.ammoniaMin,
    this.ammoniaMax,
    this.sulfurDioxideMin,
    this.sulfurDioxideMax,
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
      oxygenMin: json['oxygenMin'],
      oxygenMax: json['oxygenMax'],
      carbonDioxideMin: json['carbonDioxideMin'],
      carbonDioxideMax: json['carbonDioxideMax'],
      ethyleneMin: json['ethyleneMin'],
      ethyleneMax: json['ethyleneMax'],
      ammoniaMin: json['ammoniaMin'],
      ammoniaMax: json['ammoniaMax'],
      sulfurDioxideMin: json['sulfurDioxideMin'],
      sulfurDioxideMax: json['sulfurDioxideMax'],
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
      'oxygenMin': oxygenMin,
      'oxygenMax': oxygenMax,
      'carbonDioxideMin': carbonDioxideMin,
      'carbonDioxideMax': carbonDioxideMax,
      'ethyleneMin': ethyleneMin,
      'ethyleneMax': ethyleneMax,
      'ammoniaMin': ammoniaMin,
      'ammoniaMax': ammoniaMax,
      'sulfurDioxideMin': sulfurDioxideMin,
      'sulfurDioxideMax': sulfurDioxideMax,
    };
  }
}