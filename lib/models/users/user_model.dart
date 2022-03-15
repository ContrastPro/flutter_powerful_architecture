class UserModel {
  const UserModel({
    this.accessToken,
    this.refreshToken,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      accessToken: json['access'],
      refreshToken: json['refresh'],
      id: json['id'],
    );
  }

  final String? accessToken;
  final String? refreshToken;
  final int? id;

  UserModel copyWith({
    String? accessToken,
    String? refreshToken,
    int? id,
  }) {
    return UserModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() => {
        'access': accessToken,
        'refresh': refreshToken,
        'id': id,
      };
}
