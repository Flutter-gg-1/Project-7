class LinkModel {
  late final String? url;
  late final String type;

  LinkModel({
    this.url,
    required this.type,
  });

  LinkModel.fromJson(Map<String, dynamic> json) {
    url = null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}

