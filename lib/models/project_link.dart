class ProjectLink {
  late final String? url;
  late final String type;

  ProjectLink({
    this.url,
    required this.type,
  });

  factory ProjectLink.fromJson(Map<String, dynamic> json) {
    return ProjectLink(type: json['type'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['type'] = type;
    return data;
  }
}
