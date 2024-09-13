part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ArabicState extends AuthState {
  final bool isArabic;

  ArabicState({required this.isArabic});
}
