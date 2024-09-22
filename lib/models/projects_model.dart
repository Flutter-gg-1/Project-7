import 'package:tuwaiq_project/models/images_project_model.dart';
import 'package:tuwaiq_project/models/links_project_model.dart';
import 'package:tuwaiq_project/models/members_project_model.dart';

class ProjectsModel {
  ProjectsModel({
    required this.projectId,
    required this.type,
    required this.projectName,
    required this.bootcampName,
    this.startDate,
    this.endDate,
    this.presentationDate,
    this.projectDescription,
    this.logoUrl,
    this.presentationUrl,
    required this.userId,
    required this.adminId,
    required this.timeEndEdit,
    required this.allowEdit,
    required this.allowRating,
    required this.isPublic,
    required this.rating,
    required this.createAt,
    required this.updateAt,
    required this.imagesProject,
    required this.linksProject,
    required this.membersProject,
  });
  late final String? projectId;
  late final String? type;
  late final String? projectName;
  late final String? bootcampName;
  late final String? startDate;
  late final String? endDate;
  late final String? presentationDate;
  late final String? projectDescription;
  late final String? logoUrl;
  late final String? presentationUrl;
  late final String? userId;
  late final String? adminId;
  late final String? timeEndEdit;
  late final bool? allowEdit;
  late final bool? allowRating;
  late final bool? isPublic;
  late final num? rating;
  late final String? createAt;
  late final String? updateAt;
  late final List<ImagesProjectModel> imagesProject;
  late final List<LinksProjectModel> linksProject;
  late final List<MembersProjectModel> membersProject;

  ProjectsModel.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    type = json['type'];
    projectName = json['project_name'];
    bootcampName = json['bootcamp_name'];
    startDate = json["start_date"];
    endDate = json["end_date"];
    presentationDate = json["presentation_date"];
    projectDescription = json["project_description"];
    logoUrl = json["logo_url"];
    presentationUrl = json["presentation_url"];
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    allowRating = json['allow_rating'];
    isPublic = json['is_public'];
    rating = json['rating'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    imagesProject = (json['images_project'] as List)
        .map(
            (item) => ImagesProjectModel.fromJson(item as Map<String, dynamic>))
        .toList();
    linksProject = List.from(json['links_project'])
        .map((e) => LinksProjectModel.fromJson(e))
        .toList();

    membersProject = List.from(json['members_project'])
        .map((e) => MembersProjectModel.fromJson(e))
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
    data['allow_rating'] = allowRating;
    data['is_public'] = isPublic;
    data['rating'] = rating;
    data['create_at'] = createAt;
    data['update_at'] = updateAt;
    data['images_project'] = imagesProject;
    data['links_project'] = linksProject;
    data['members_project'] = membersProject.map((e) => e.toJson()).toList();
    return data;
  }
}
