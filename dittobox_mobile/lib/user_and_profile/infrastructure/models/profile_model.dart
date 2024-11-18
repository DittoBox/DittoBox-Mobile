class Profile{
  int id;
  String firstName;
  String lastName;
  int? accountId;
  int? groupId;
  int userId;
  List<String> privileges;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.accountId,
    this.groupId,
    required this.userId,
    required this.privileges,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      accountId: json['accountId'],
      groupId: json['groupId'],
      userId: json['userId'],
      privileges: List<String>.from(json['privileges']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'accountId': accountId,
      'groupId': groupId,
      'userId': userId,
      'privileges': privileges,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      accountId: map['accountId'],
      groupId: map['groupId'],
      userId: map['userId'],
      privileges: List<String>.from(map['privileges']),
    );
  }
}