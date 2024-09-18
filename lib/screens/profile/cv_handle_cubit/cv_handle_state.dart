part of 'cv_handle_cubit.dart';

@immutable
sealed class CvHandleState {}

final class CvHandleInitial extends CvHandleState {}

final class CvHereState extends CvHandleState {
  final List<int> cVFile;
  final String cvName;

  CvHereState(this.cvName, {required this.cVFile});
}

final class CvNoState extends CvHandleState {
  CvNoState();
}
