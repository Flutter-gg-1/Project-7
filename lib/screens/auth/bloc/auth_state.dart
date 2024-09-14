part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ArabicState extends AuthState {
  final bool isArabic;

  ArabicState({required this.isArabic});
}
final class LoadingState extends AuthState {}

final class SuccessState extends AuthState {}

final class ErrorState extends AuthState {
  final String msg;

  ErrorState({required this.msg});
}
