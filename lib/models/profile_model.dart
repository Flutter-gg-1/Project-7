import 'package:project_management_app/models/project_model.dart';
import 'link_model.dart';

class Profile {
  String id;
  String firstName;
  String lastName;
  String email;
  String role;
  String imageUrl;
  String resumeUrl;
  LinkModel link;
  List<ProjectModel> projects;
  String createdAt;
  String updatedAt;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    required this.imageUrl,
    required this.resumeUrl,
    required this.link,
    required this.projects,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
  return Profile(
    id: json['id'].toString(),
    firstName: json['first_name'].toString(),
    lastName: json['last_name'].toString(),
    email: json['email'].toString(),
    role: json['role'].toString(),
    imageUrl: json['image_url'].toString(),
    resumeUrl: json['resume_url'].toString(),
    link: LinkModel.fromJson(json['link']),
    projects: json['projects'] != null
    ? List<Map<String, dynamic>>.from(json['projects'])
        .map((e) => ProjectModel.fromJson(e))
        .toList()
    : [],
    createdAt: json['created_at'].toString(),
    updatedAt: json['updated_at'].toString(),
  );
}

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['image_url'] = imageUrl;
    data['resume_url'] = resumeUrl;
    data['link'] = link?.toJson();
    data['projects'] = projects?.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
