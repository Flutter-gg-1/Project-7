class LinkModel {
  late final String? github;
  late final String? linkedin;
  late final String? bindlink;
  LinkModel(
      {required this.github, required this.linkedin, required this.bindlink});

  LinkModel.fromJson(Map json) {
    github = json["github"];
    linkedin = json["linkedin"];
    bindlink = json["bindlink"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data["github"] = github;
    data["linkedin"] = linkedin;
    data["bindlink"] = bindlink;
    return data;
  }
}
