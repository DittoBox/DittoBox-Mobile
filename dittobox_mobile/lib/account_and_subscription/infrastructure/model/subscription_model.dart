class Subscription {
  final int id;
  final int accountId;
  final String tier;
  final DateTime paymentDate;
  final int subscriptionStatusId;
  final DateTime lastPaidPeriod;

  Subscription({
    required this.id,
    required this.accountId,
    required this.tier,
    required this.paymentDate,
    required this.subscriptionStatusId,
    required this.lastPaidPeriod,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      accountId: json['accountId'],
      tier: json['tier'],
      paymentDate: DateTime.parse(json['paymentDate']),
      subscriptionStatusId: json['subscriptionStatusId'],
      lastPaidPeriod: DateTime.parse(json['lastPaidPeriod']),
    );
  }
}