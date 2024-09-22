import 'user_model.dart';

class ProjectsInfo {
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
  final bool allowEdit;
  final bool allowRating;
  final bool isPublic;
  final int? rating;
  final String? createAt;
  final String? updateAt;
  final List<ImagesProject>? imagesProject;
  final List<LinksProject>? linksProject;
  final List<MembersProject>? membersProject;

  ProjectsInfo({
    required this.projectId,
    required this.type,
    this.projectName,
    this.bootcampName,
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
    required List<ImagesProject>? imagesProject,
    required List<LinksProject>? linksProject,
    required List<MembersProject>? membersProject,
  })  : linksProject = linksProject ?? [],
        membersProject = membersProject ?? [],
        imagesProject = imagesProject ?? [];

  ProjectsInfo.fromJson(Map<String, dynamic> json)
      : projectId = json['project_id'],
        type = json['type'],
        projectName = json['project_name'],
        bootcampName = json['bootcamp_name'],
        startDate = json['start_date'],
        endDate = json['end_date'],
        presentationDate = json['presentation_date'],
        projectDescription = json['project_description'],
        logoUrl = json['logo_url'],
        presentationUrl = json['presentation_url'],
        userId = json['user_id'],
        adminId = json['admin_id'],
        timeEndEdit = json['time_end_edit'],
        allowEdit = json['allow_edit'],
        allowRating = json['allow_rating'],
        isPublic = json['is_public'],
        rating = json['rating'],
        createAt = json['create_at'],
        updateAt = json['update_at'],
        imagesProject = List.from(json['images_project'])
            .map((e) => ImagesProject.fromJson(e))
            .toList(),
        linksProject = List.from(json['links_project'])
            .map((e) => LinksProject.fromJson(e))
            .toList(),
        membersProject = List.from(json["members_project"])
            .map((e) => MembersProject.fromJson(e))
            .toList();

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
      'allow_rating': allowRating,
      'is_public': isPublic,
      'rating': rating,
      'create_at': createAt,
      'update_at': updateAt,
      'images_project': imagesProject,
      'links_project': linksProject,
      'members_project': membersProject?.map((e) => e.toJson()).toList(),
    };
  }
}

class ImagesProject {
  ImagesProject({
    required this.id,
    required this.url,
  });
  late final int id;
  late final String url;

  ImagesProject.fromJson(Map<String, dynamic> json) {
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

class LinksProject {
  late final String? url;
  late final String? type;

  LinksProject({this.url, this.type});

  LinksProject.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["url"] = url;
    data["type"] = type;
    return data;
  }
}
