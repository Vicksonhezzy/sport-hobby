class UserModel {
  String? id;
  String? number;
  String? email;
  bool? emailVerified;
  bool? numberVerified;
  String? username;
  List? interest;

  UserModel({
    this.email,
    this.emailVerified,
    this.id,
    this.number,
    this.numberVerified,
    this.username,
    this.interest,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['data']['email'],
      emailVerified: json['data']['emailVerified'],
      id: json['data']['id'],
      number: json['data']['number'],
      numberVerified: json['data']['numberVerified'],
      username: json['data']['username'],
      interest: json['data']['interest'] ?? [],
    );
  }
}

late UserModel user;
