class Container {
  final int id;
  final String name;
  final String description;
  final double temperature;
  final double humidity;
  final double oxygen;
  final double dioxide;
  final double ethylene;
  final double ammonia;
  final double sulfurDioxide;
  final double minTemp;
  final double maxTemp;
  final double minHumidity;
  final double maxHumidity;
  final double oxygenMin;
  final double oxygenMax;
  final double dioxideMin;
  final double dioxideMax;
  final double ethyleneMin;
  final double ethyleneMax;
  final double ammoniaMin;
  final double ammoniaMax;
  final double sulfurDioxideMin;
  final double sulfurDioxideMax;
  final String lastKnownHealthStatus;
  final String lastKnownContainerStatus;
  final DateTime lastSync;

  Container({
    required this.id,
    required this.name,
    required this.description,
    required this.temperature,
    required this.humidity,
    required this.oxygen,
    required this.dioxide,
    required this.ethylene,
    required this.ammonia,
    required this.sulfurDioxide,
    required this.minTemp,
    required this.maxTemp,
    required this.minHumidity,
    required this.maxHumidity,
    required this.oxygenMin,
    required this.oxygenMax,
    required this.dioxideMin,
    required this.dioxideMax,
    required this.ethyleneMin,
    required this.ethyleneMax,
    required this.ammoniaMin,
    required this.ammoniaMax,
    required this.sulfurDioxideMin,
    required this.sulfurDioxideMax,
    required this.lastKnownHealthStatus,
    required this.lastKnownContainerStatus,
    required this.lastSync,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      oxygen: (json['oxygen'] as num).toDouble(),
      dioxide: (json['dioxide'] as num).toDouble(),
      ethylene: (json['ethylene'] as num).toDouble(),
      ammonia: (json['ammonia'] as num).toDouble(),
      sulfurDioxide: (json['sulfurDioxide'] as num).toDouble(),
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      minHumidity: (json['minHumidity'] as num).toDouble(),
      maxHumidity: (json['maxHumidity'] as num).toDouble(),
      oxygenMin: (json['oxygenMin'] as num).toDouble(),
      oxygenMax: (json['oxygenMax'] as num).toDouble(),
      dioxideMin: (json['dioxideMin'] as num).toDouble(),
      dioxideMax: (json['dioxideMax'] as num).toDouble(),
      ethyleneMin: (json['ethyleneMin'] as num).toDouble(),
      ethyleneMax: (json['ethyleneMax'] as num).toDouble(),
      ammoniaMin: (json['ammoniaMin'] as num).toDouble(),
      ammoniaMax: (json['ammoniaMax'] as num).toDouble(),
      sulfurDioxideMin: (json['sulfurDioxideMin'] as num).toDouble(),
      sulfurDioxideMax: (json['sulfurDioxideMax'] as num).toDouble(),
      lastKnownHealthStatus: json['lastKnownHealthStatus'],
      lastKnownContainerStatus: json['lastKnownContainerStatus'],
      lastSync: DateTime.parse(json['lastSync']),
    );
  }
}
