import 'package:tuwaiq_project/models/images_project_model.dart';
import 'package:tuwaiq_project/models/link_model.dart';
import 'package:tuwaiq_project/models/links_project_model.dart';
import 'package:tuwaiq_project/models/members_project_model.dart';
import 'package:tuwaiq_project/models/projects_model.dart';

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.imageFile,
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
  late final String? imageFile;
  late final LinkModel link;
  late final List<ProjectsModel> projects;
  late final String createdAt;
  late final String updatedAt;
  late final String? resumeFile;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    imageFile = json['image_url'];
    link = LinkModel.fromJson(json['link']);
    projects = List.from(json['projects'])
        .map((e) => ProjectsModel.fromJson(e))
        .toList();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resumeFile = json['resume'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['image_url'] = imageFile;
    data['link'] = link.toJson();
    data['projects'] = projects.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['resume'] = resumeFile;
    return data;
  }
}
