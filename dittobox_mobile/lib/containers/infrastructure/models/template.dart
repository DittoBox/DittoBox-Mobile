class Template {
  final int id;
  final String name;
  final String description;
  final String? category; // Produce, Meats, Animal derived, Processed Food
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
    required this.id,
    required this.name,
    required this.description,
    this.category,
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
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      category: json['category']?.toString(),
      tempMin: (json['minTemperatureThreshold'] as num?)?.toDouble() ?? 0.0,
      tempMax: (json['maxTemperatureThreshold'] as num?)?.toDouble() ?? 0.0,
      humidityMin: (json['minHumidityThreshold'] as num?)?.toDouble() ?? 0.0,
      humidityMax: (json['maxHumidityThreshold'] as num?)?.toDouble() ?? 0.0,
      oxygenMin: (json['minOxygenThreshold'] as num?)?.toDouble(),
      oxygenMax: (json['maxOxygenThreshold'] as num?)?.toDouble(),
      carbonDioxideMin: (json['minCarbonDioxideThreshold'] as num?)?.toDouble(),
      carbonDioxideMax: (json['maxCarbonDioxideThreshold'] as num?)?.toDouble(),
      ethyleneMin: (json['minEthyleneThreshold'] as num?)?.toDouble(),
      ethyleneMax: (json['maxEthyleneThreshold'] as num?)?.toDouble(),
      ammoniaMin: (json['minAmmoniaThreshold'] as num?)?.toDouble(),
      ammoniaMax: (json['maxAmmoniaThreshold'] as num?)?.toDouble(),
      sulfurDioxideMin: (json['minSulfurDioxideThreshold'] as num?)?.toDouble(),
      sulfurDioxideMax: (json['maxSulfurDioxideThreshold'] as num?)?.toDouble(),
    );
  }
}