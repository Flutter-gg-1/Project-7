part of 'mange_user_cubit.dart';

@immutable
sealed class MangeUserState {}

final class MangeUserInitial extends MangeUserState {}

final class LoadingState extends MangeUserState {}

final class SwitchButtonState extends MangeUserState {
  final bool isSwitched;

  SwitchButtonState({required this.isSwitched});
}

final class SuccessState extends MangeUserState {}

final class ErrorState extends MangeUserState {
  final String msg;
  ErrorState({required this.msg});
}
