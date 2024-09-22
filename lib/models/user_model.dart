class UserModel {
  UserModel({this.token, this.refreshToken, this.expiresAt, this.id});
  late final String? token;
  late final String? refreshToken;
  late final int? expiresAt;
  late final String? id;

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    expiresAt = json['expiresAt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['expiresAt'] = expiresAt;
    return data;
  }
}
