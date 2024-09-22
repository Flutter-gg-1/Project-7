class ImagesProjectModel {
  ImagesProjectModel({
    required this.id,
    required this.url,
  });
  late final int id;
  late final String url;

  ImagesProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}
