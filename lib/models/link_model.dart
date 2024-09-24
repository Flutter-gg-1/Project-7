class LinkModel {
  late final String? github;
  late final String? linkedin;
  late final String? bindlink;
  late final String? resumeFile;
  LinkModel(
      {required this.github, required this.linkedin, required this.bindlink , required this.resumeFile});

  LinkModel.fromJson(Map json) {
    github = json["github"];
    linkedin = json["linkedin"];
    bindlink = json["bindlink"];
    resumeFile = json['resume'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data["github"] = github;
    data["linkedin"] = linkedin;
    data["bindlink"] = bindlink;
     data['resume'] = resumeFile;
    return data;
  }
}
