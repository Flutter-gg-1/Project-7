import 'project_info_model.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.imageUrl,
    required this.link,
    required this.projects,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String role;
  late final String imageUrl;
  late final Link link;
  late final List<ProjectsInfo> projects;
  late final String createdAt;
  late final String updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    imageUrl = json['imageUrl'];
    link = Link.fromJson(json['link']);
    projects =
        List.from(json['projects']).map((e) => ProjectsInfo.fromJson(e)).toList();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['role'] = role;
    _data['image_url'] = imageUrl;
    _data['link'] = link.toJson();
    _data['projects'] = projects.map((e) => e.toJson()).toList();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Link {
  Link({
    required this.github,
    required this.linkedin,
    required this.bindlink,
  });
  late final String? github;
  late final String? linkedin;
  late final String? bindlink;

  Link.fromJson(Map<String, dynamic> json) {
    github = json['github'];
    linkedin = json['linkedin'];
    bindlink = json['bindlink'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['github'] = github;
    _data['linkedin'] = linkedin;
    _data['bindlink'] = bindlink;
    return _data;
  }
}

class MembersProject {
  MembersProject({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.position,
    this.imageUrl,
    required this.link,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String position;
  late final Null imageUrl;
  late final Link link;

  MembersProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    position = json['position'];
    imageUrl = null;
    link = Link.fromJson(json['link']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['position'] = position;
    _data['image_url'] = imageUrl;
    _data['link'] = link.toJson();
    return _data;
  }
  
}
