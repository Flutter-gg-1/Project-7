class LinksProjectModel {
  LinksProjectModel({
    required this.url,
    required this.type,
  });
  late final String url;
  late final String type;

  LinksProjectModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}
