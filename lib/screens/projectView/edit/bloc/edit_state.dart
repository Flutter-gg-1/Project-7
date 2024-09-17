part of 'edit_bloc.dart';

@immutable
sealed class EditState {}

final class EditInitial extends EditState {}

final class SucsessState extends EditState {
  final String msg;

  SucsessState({required this.msg});
}

class EditChangeState extends EditState {
  final bool isEdit;
  EditChangeState({required this.isEdit});
}
