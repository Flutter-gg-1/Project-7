class ProjectsModel {
  ProjectsModel({
    required this.projectId,
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
    required this.isPublic,
    required this.createAt,
     this.updateAt,
    required this.type,
    required this.rating,
    required this.allowRating,
    required this.imagesProject,
    required this.linksProject,
    required this.membersProject,
  });
  late final String? projectId;
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
  late final bool allowEdit;
  late final bool isPublic;
  late final String? createAt;
  late final String? updateAt;
  late final String type;
  late final int? rating;
  late final bool? allowRating;
  late final List<dynamic>? imagesProject;
  late final List<dynamic>? linksProject;
  late final List<dynamic>? membersProject;
  
  ProjectsModel.fromJson(Map<String, dynamic> json){
    projectId = json['project_id'];
    projectName = null;
    bootcampName = null;
    startDate = null;
    endDate = null;
    presentationDate = null;
    projectDescription = null;
    logoUrl = null;
    presentationUrl = null;
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    isPublic = json['is_public'];
    createAt = json['create_at'];
    updateAt = null;
    type = json['type'];
    rating = json['rating'];
    allowRating = json['allow_rating'];
    imagesProject = List.castFrom<dynamic, dynamic>(json['images_project']);
    linksProject = List.castFrom<dynamic, dynamic>(json['links_project']);
    membersProject = List.castFrom<dynamic, dynamic>(json['members_project']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['project_id'] = projectId;
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
    data['type'] = type;
    data['rating'] = rating;
    data['allow_rating'] = allowRating;
    data['images_project'] = imagesProject;
    data['links_project'] = linksProject;
    data['members_project'] = membersProject;
    return data;
  }
}