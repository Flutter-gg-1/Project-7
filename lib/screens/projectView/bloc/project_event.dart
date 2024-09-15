part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class ProfileImageChangeEvent extends ProjectEvent{}
class LogoImageChangeEvent extends ProjectEvent{}
class ProjectImageChangeEvent extends ProjectEvent{}
class PresentationImageChangeEvent extends ProjectEvent{}