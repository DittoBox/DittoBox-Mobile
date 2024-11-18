class Account {
  final int id;
  final String businessName;
  final String businessId;
  final int representativeId;

  Account({
    required this.id,
    required this.businessName,
    required this.businessId,
    required this.representativeId,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      businessName: json['businessName'],
      businessId: json['bussinessId'], // Asegúrate de que el nombre del campo coincida con el JSON
      representativeId: json['representativeId'],
    );
  }
}