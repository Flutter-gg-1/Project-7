part of 'edit_project_bloc.dart';

abstract class EditProjectEvent {}

// Load Project Data
class LoadProjectData extends EditProjectEvent {
  final ProjectModel project;
  LoadProjectData(this.project);
}

// Update Project Status
class UpdateProjectStatus extends EditProjectEvent {
  final bool isEditable;
  final bool isPublic;
  final String endTime;

  UpdateProjectStatus({
    required this.isEditable,
    required this.isPublic,
    required this.endTime,
  });
}

// Save Basic Info
class SaveBasicInfo extends EditProjectEvent {
  final String projectName;
  final String bootcampName;
  final String projectType;
  final String startDate;
  final String endDate;
  final String presentationDate;
  final String projectDescription;

  SaveBasicInfo({
    required this.projectName,
    required this.bootcampName,
    required this.projectType,
    required this.startDate,
    required this.endDate,
    required this.presentationDate,
    required this.projectDescription,
  });
}

// Save Links
class SaveProjectLinks extends EditProjectEvent {
  final String githubLink;
  final String figmaLink;
  final String videoLink;
  final String pinterestLink;
  final String playStoreLink;
  final String appleStoreLink;
  final String apkLink;
  final String webLink;

  SaveProjectLinks({
    required this.githubLink,
    required this.figmaLink,
    required this.videoLink,
    required this.pinterestLink,
    required this.playStoreLink,
    required this.appleStoreLink,
    required this.apkLink,
    required this.webLink,
  });
}

// Save Members
class SaveMembers extends EditProjectEvent {
  final List<MemberModel> members;

  SaveMembers(this.members);
}

// Upload Files (Logo, Presentation, Images)
class UploadLogo extends EditProjectEvent {
  final File logo;
  UploadLogo(this.logo);
}

class UploadPresentation extends EditProjectEvent {
  final File presentation;
  UploadPresentation(this.presentation);
}

class UploadImages extends EditProjectEvent {
  final List<File> images;
  UploadImages(this.images);
}