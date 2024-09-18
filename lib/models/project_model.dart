import 'package:project_management_app/models/image_model.dart';
import 'package:project_management_app/models/project_link.dart';
import 'member_model.dart';

class ProjectModel {
  final String? projectId;
  final String? type;
  final String? projectName;
  final String? bootcampName;
  final String? startDate;
  final String? endDate;
  final String? presentationDate;
  final String? projectDescription;
  final String? logoUrl;
  final String? presentationUrl;
  final String? userId;
  final String? adminId;
  final String? timeEndEdit;
  final bool? allowEdit;
  final bool? isPublic;
  final String? createAt;
  final String? updateAt;
  final List<ImageModel>? imagesProject;
  final List<ProjectLink>? linksProject;
  final List<MemberModel>? membersProject;

  ProjectModel({
    this.projectId,
    this.type,
    this.projectName,
    this.bootcampName,
    this.startDate,
    this.endDate,
    this.presentationDate,
    this.projectDescription,
    this.logoUrl,
    this.presentationUrl,
    this.userId,
    this.adminId,
    this.timeEndEdit,
    this.allowEdit,
    this.isPublic,
    this.createAt,
    this.updateAt,
    this.imagesProject,
    this.linksProject,
    this.membersProject,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectId: json['project_id'].toString(),
      type: json['type'].toString(),
      projectName: json['project_name'].toString(),
      bootcampName: json['bootcamp_name'].toString(),
      startDate: json['start_date'].toString(),
      endDate: json['end_date'].toString(),
      presentationDate: json['presentation_date'].toString(),
      projectDescription: json['project_description'].toString(),
      logoUrl: json['logo_url'].toString(),
      presentationUrl: json['presentation_url'].toString(),
      userId: json['user_id'].toString(),
      adminId: json['admin_id'].toString(),
      timeEndEdit: json['time_end_edit'].toString(),
      allowEdit: json['allow_edit'] as bool,
      isPublic: json['is_public'] as bool,
      createAt: json['create_at'].toString(),
      updateAt: json['update_at'].toString(),
      imagesProject: (json['images_project'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      linksProject: (json['links_project'] as List<dynamic>?)
          ?.map((e) => ProjectLink.fromJson(e as Map<String, dynamic>))
          .toList(),
      membersProject: (json['members_project'] as List<dynamic>?)
          ?.map((e) => MemberModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'type': type,
      'project_name': projectName,
      'bootcamp_name': bootcampName,
      'start_date': startDate,
      'end_date': endDate,
      'presentation_date': presentationDate,
      'project_description': projectDescription,
      'logo_url': logoUrl,
      'presentation_url': presentationUrl,
      'user_id': userId,
      'admin_id': adminId,
      'time_end_edit': timeEndEdit,
      'allow_edit': allowEdit,
      'is_public': isPublic,
      'create_at': createAt,
      'update_at': updateAt,
      'images_project': imagesProject?.map((e) => e.toJson()).toList(),
      'links_project': linksProject?.map((e) => e.toJson()).toList(),
      'members_project': membersProject?.map((e) => e.toJson()).toList(),
    };
  }
}
