part of 'bottomnav_bloc.dart';

@immutable
sealed class BottomnavState {}

final class BottomnavInitial extends BottomnavState {}

final class IndexChangeState extends BottomnavState {
  final int index;

  IndexChangeState({required this.index});
}
