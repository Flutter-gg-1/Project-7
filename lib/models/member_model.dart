class MemberModel {
  late final String position;
  late final String userId;
  
  MemberModel({
    required this.position,
    required this.userId,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(position: json['position'], userId: json['user_id']);
  }

  Map<String, dynamic> toJson() {
    return {'position': position, 'user_id': userId};
  }
}
