
class LinkModel {
  late final String github;
  late final String linkedin;
  late final String resume;
  late final String bindlink;

  LinkModel({
    required this.github,
    required this.linkedin,
    required this.resume,
    required this.bindlink,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      github: json['github'],
      linkedin: json['linkedin'],
      resume: json['resume'],
      bindlink: json['bindlink'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['github'] = github;
    data['linkedin'] = linkedin;
    data['resume'] = resume;
    data['bindlink'] = bindlink;
    return data;
  }
}
