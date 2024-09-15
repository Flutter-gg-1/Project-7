part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class ImageChangeEvent extends ProjectEvent{}