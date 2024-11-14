class Profile{
  String firstName;
  String lastName;
  int accountId;
  int groupId;
  List<String> privileges;

  Profile({
    required this.firstName,
    required this.lastName,
    required this.accountId,
    required this.groupId,
    required this.privileges,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      firstName: json['firstName'],
      lastName: json['lastName'],
      accountId: json['accountId'],
      groupId: json['groupId'],
      privileges: List<String>.from(json['privileges']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'accountId': accountId,
      'groupId': groupId,
      'privileges': privileges,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      firstName: map['firstName'],
      lastName: map['lastName'],
      accountId: map['accountId'],
      groupId: map['groupId'],
      privileges: List<String>.from(map['privileges']),
    );
  }
}