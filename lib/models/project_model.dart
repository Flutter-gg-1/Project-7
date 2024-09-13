class ProjectModel {
  String projectId;
  String? projectName;
  String? bootcampName;
  String? startDate;
  String? endDate;
  String? presentationDate;
  String? projectDescription;
  String? logoUrl;
  String? presentationUrl;
  String userId;
  String adminId;
  String timeEndEdit;
  bool allowEdit;
  bool isPublic;
  String createAt;
  String? updateAt;
  String type;
  List<dynamic> imagesProject;
  List<dynamic> linksProject;
  List<dynamic> membersProject;

  ProjectModel({
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
    this.allowEdit = false,
    this.isPublic = false,
    required this.createAt,
    this.updateAt,
    required this.type,
    required this.imagesProject,
    required this.linksProject,
    required this.membersProject,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      projectId: json['project_id'] as String,
      projectName: json['project_name'] as String?,
      bootcampName: json['bootcamp_name'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      presentationDate: json['presentation_date'] as String?,
      projectDescription: json['project_description'] as String?,
      logoUrl: json['logo_url'] as String?,
      presentationUrl: json['presentation_url'] as String?,
      userId: json['user_id'] as String,
      adminId: json['admin_id'] as String,
      timeEndEdit: json['time_end_edit'] as String,
      allowEdit: json['allow_edit'] as bool,
      isPublic: json['is_public'] as bool,
      createAt: json['create_at'] as String,
      updateAt: json['update_at'] as String?,
      type: json['type'] as String,
      imagesProject: List.from(json['images_project'] as List),
      linksProject: List.from(json['links_project'] as List),
      membersProject: List.from(json['members_project'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['project_name'] = projectName.toString();
    data['bootcamp_name'] = bootcampName.toString();
    data['start_date'] = startDate.toString();
    data['end_date'] = endDate.toString();
    data['presentation_date'] = presentationDate.toString();
    data['project_description'] = projectDescription.toString();
    data['logo_url'] = logoUrl.toString();
    data['presentation_url'] = presentationUrl.toString();
    data['user_id'] = userId;
    data['admin_id'] = adminId;
    data['time_end_edit'] = timeEndEdit;
    data['allow_edit'] = allowEdit;
    data['is_public'] = isPublic;
    data['create_at'] = createAt;
    data['update_at'] = updateAt.toString();
    data['type'] = type;
    data['images_project'] = imagesProject;
    data['links_project'] = linksProject;
    data['members_project'] = membersProject;
    return data;
  }
}
