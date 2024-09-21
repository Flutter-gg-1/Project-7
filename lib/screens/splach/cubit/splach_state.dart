part of 'splach_cubit.dart';

@immutable
sealed class SplachState {}

final class SplachInitial extends SplachState {}

final class LoginUserState extends SplachState {}

final class NotLoginUserState extends SplachState {}
