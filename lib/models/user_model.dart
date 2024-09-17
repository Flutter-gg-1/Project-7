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
  late final String? id;
  late final String? firstName;
  late final String? lastName;
  late final String? email;
  late final String? role;
  late final String? imageUrl;
  late final Link? link;
  late final List<Projects>? projects;
  late final String? createdAt;
  late final String? updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    role = json['role'];
    imageUrl = json['imageUrl'];
    link = Link.fromJson(json['link']);
    projects =
        List.from(json['projects']).map((e) => Projects.fromJson(e)).toList();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['image_url'] = imageUrl;
    data['link'] = link?.toJson();
    data['projects'] = projects?.map((e) => e.toJson()).toList();
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
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
    final data = <String, dynamic>{};
    data['github'] = github;
    data['linkedin'] = linkedin;
    data['bindlink'] = bindlink;
    return data;
  }
}

class Projects {
  Projects({
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
  late final int? rating;
  late final String? createAt;
  late final String? updateAt;
  late final List<dynamic>? imagesProject;
  late final List<dynamic>? linksProject;
  late final List<MembersProject>? membersProject;

  Projects.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    type = json['type'];
    projectName = json['projectName'];
    bootcampName = json['bootcampName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    presentationDate = json['presentationDate'];
    projectDescription = json['projectDescription'];
    logoUrl = json['logoUrl'];
    presentationUrl = json['presentationUrl'];
    userId = json['user_id'];
    adminId = json['admin_id'];
    timeEndEdit = json['time_end_edit'];
    allowEdit = json['allow_edit'];
    allowRating = json['allow_rating'];
    isPublic = json['is_public'];
    rating = json['rating'];
    createAt = json['create_at'];
    updateAt = json['update_at'];
    imagesProject = List.castFrom<dynamic, dynamic>(json['images_project']);
    linksProject = List.castFrom<dynamic, dynamic>(json['links_project']);
    membersProject = List.from(json['members_project'])
        .map((e) => MembersProject.fromJson(e))
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
    data['members_project'] = membersProject?.map((e) => e.toJson()).toList();
    return data;
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
  late final String? id;
  late final String? firstName;
  late final String? lastName;
  late final String? email;
  late final String? position;
  late final String? imageUrl;
  late final Link? link;

  MembersProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    position = json['position'];
    imageUrl = json['ImageUrl'];
    link = Link.fromJson(json['link']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['position'] = position;
    data['image_url'] = imageUrl;
    data['link'] = link?.toJson();
    return data;
  }
}
