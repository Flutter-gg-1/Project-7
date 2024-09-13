import 'package:project_management_app/models/image_model.dart';
import 'package:project_management_app/models/link_model.dart';
import 'package:project_management_app/models/user_model.dart';

class ProjectModel {
  late final String projectId;
  late final String type;
  late final String projectName;
  late final String bootcampName;
  late final String startDate;
  late final String endDate;
  late final String presentationDate;
  late final String projectDescription;
  late final String logoUrl;
  late final String presentationUrl;
  late final String userId;
  late final String adminId;
  late final String timeEndEdit;
  late final bool allowEdit;
  late final bool isPublic;
  late final String createAt;
  late final String updateAt;
  late final List<ImageModel> imagesProject;
  late final List<LinkModel> linksProject;
  late final List<UserModel> membersProject;

  ProjectModel({
    required this.projectId,
    required this.type,
    required this.projectName,
    required this.bootcampName,
    required this.startDate,
    required this.endDate,
    required this.presentationDate,
    required this.projectDescription,
    required this.logoUrl,
    required this.presentationUrl,
    required this.userId,
    required this.adminId,
    required this.timeEndEdit,
    required this.allowEdit,
    required this.isPublic,
    required this.createAt,
    required this.updateAt,
    required this.imagesProject,
    required this.linksProject,
    required this.membersProject,
  });

  ProjectModel.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    type = json['type'];
    projectName = json['project_name'];
    bootcampName = json['bootcamp_name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    presentationDate = json['presentation_date'];
    projectDescription = json['project_description'];
    logoUrl = json['logo_url'];
    presentationUrl = json['presentation_url'];
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    isPublic = json['is_public'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    imagesProject = List.from(json['images_project'])
        .map((e) => ImageModel.fromJson(e))
        .toList();
    linksProject = List.from(json['links_project'])
        .map((e) => LinkModel.fromJson(e))
        .toList();
    membersProject = List.from(json['members_project'])
        .map((e) => UserModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['type'] = type;
    data['project_name'] = projectName;
    data['bootcamp_name'] = bootcampName;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['presentation_date'] = presentationDate;
    data['project_description'] = projectDescription;
    data['logo_url'] = logoUrl;
    data['presentation_url'] = presentationUrl;
    data['user_id'] = userId;
    data['admin_id'] = adminId;
    data['time_end_edit'] = timeEndEdit;
    data['allow_edit'] = allowEdit;
    data['is_public'] = isPublic;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['images_project'] = imagesProject.map((e) => e.toJson()).toList();
    data['links_project'] = linksProject.map((e) => e.toJson()).toList();
    data['members_project'] = membersProject.map((e) => e.toJson()).toList();
    return data;
  }
}
