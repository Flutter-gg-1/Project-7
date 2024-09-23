part of 'update_cubit.dart';

@immutable
sealed class UpdateState {}

final class UpdateInitial extends UpdateState {}

final class UpdateErorrState extends UpdateState {
  final String msg;

  UpdateErorrState({required this.msg});
}

final class UpdateLodaingState extends UpdateState {}

final class GoodState extends UpdateState {}
