class UserModel {
  String uid;
  String displayName;
  String email;
  String password;
  String providerId;

  UserModel({
    this.uid,
    this.displayName,
    this.email,
    this.password,
    this.providerId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      password: json['password'],
      providerId: json['providerId'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'email': email,
    'password': password,
    'providerId': providerId,
  };
}