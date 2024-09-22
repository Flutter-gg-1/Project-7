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
  late final Link link;
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
    link = Link.fromJson(json['link']);
    projects = List.from(json['projects'])
        .map((e) => ProjectsModel.fromJson(e))
        .toList();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    resumeFile = json['resume_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['role'] = role;
    _data['image_url'] = imageFile;
    _data['link'] = link.toJson();
    _data['projects'] = projects.map((e) => e.toJson()).toList();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['resume_url'] = resumeFile;
    return _data;
  }
}

class Link {
  late final String? github;
  late final String? linkedin;
  late final String? bindlink;
  Link({required this.github, required this.linkedin, required this.bindlink});

  Link.fromJson(Map json) {
    github = json["github"];
    linkedin = json["linkedin"];
    bindlink = json["bindlink"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    _data["github"] = github;
    _data["linkedin"] = linkedin;
    _data["bindlink"] = bindlink;
    return _data;
  }
}

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
  late final List<ImagesProject> imagesProject;
  late final List<LinksProject> linksProject;
  late final List<MembersProject> membersProject;

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
    .map((item) => ImagesProject.fromJson(item as Map<String, dynamic>))
    .toList();
    linksProject = List.from(json['links_project'])
        .map((e) => LinksProject.fromJson(e))
        .toList();



    membersProject = List.from(json['members_project'])
        .map((e) => MembersProject.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['project_id'] = projectId;
    _data['type'] = type;
    _data['project_name'] = projectName;
    _data['bootcamp_name'] = bootcampName;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['presentation_date'] = presentationDate;
    _data['project_description'] = projectDescription;
    _data['logo_url'] = logoUrl;
    _data['presentation_url'] = presentationUrl;
    _data['user_id'] = userId;
    _data['admin_id'] = adminId;
    _data['time_end_edit'] = timeEndEdit;
    _data['allow_edit'] = allowEdit;
    _data['allow_rating'] = allowRating;
    _data['is_public'] = isPublic;
    _data['rating'] = rating;
    _data['create_at'] = createAt;
    _data['update_at'] = updateAt;
    _data['images_project'] = imagesProject;
    _data['links_project'] = linksProject;
    _data['members_project'] = membersProject.map((e) => e.toJson()).toList();
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
  late final String? imageUrl;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['url'] = url;
    return _data;
  }
}






class LinksProject {
  LinksProject({
    required this.url,
    required this.type,
  });
  late final String url;
  late final String type;
  
  LinksProject.fromJson(Map<String, dynamic> json){
    url = json['url'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['type'] = type;
    return _data;
  }
}
