//  save token of the user to use later and save it in getStorge
class UserModel {
  UserModel({
     this.token,
     this.refreshToken,
     this.expiresAt,
     this.id
  });
  late final String? token;
  late final String? refreshToken;
  late final int? expiresAt;
  late final String? id;

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
    expiresAt = json['expiresAt'];
    id =  "8aad6d54-87ad-4d05-953d-bbf020637bac"   ;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['refreshToken'] = refreshToken;
    _data['expiresAt'] = expiresAt;
    return _data;
  }
}
