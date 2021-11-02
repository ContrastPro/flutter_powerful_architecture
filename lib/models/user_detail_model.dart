class UserDetailModel {
  String uid;
  String displayName;
  String email;
  String password;
  String providerId;
  Timestamp creationTime;
  Timestamp lastSignInTime;
  Timestamp lastFeedback;

  UserDetailModel({
    this.uid,
    this.displayName,
    this.email,
    this.password,
    this.providerId,
    this.creationTime,
    this.lastSignInTime,
    this.lastFeedback,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      uid: json['uid'],
      displayName: json['displayName'],
      email: json['email'],
      password: json['password'],
      providerId: json['providerId'],
      creationTime: json['creationTime'],
      lastSignInTime: json['lastSignInTime'],
      lastFeedback: json['lastFeedback'],
    );
  }

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'email': email,
    'password': password,
    'providerId': providerId,
    'creationTime': creationTime,
    'lastSignInTime': lastSignInTime,
    'lastFeedback': lastFeedback,
  };
}