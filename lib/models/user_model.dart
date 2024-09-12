

//  save token of the user to use later and save it in getStorge
class UserModel {
  UserModel({
    required this.token,
    required this.refreshToken,
    required this.expiresAt,
  });
  late final String token;
  late final String refreshToken;
  late final int expiresAt;
  
  UserModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
    refreshToken = json['refreshToken'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['refreshToken'] = refreshToken;
    _data['expiresAt'] = expiresAt;
    return _data;
  }
}