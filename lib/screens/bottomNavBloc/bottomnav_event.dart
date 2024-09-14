part of 'bottomnav_bloc.dart';

@immutable
sealed class BottomnavEvent {}

class NavigatorBetweenScreenEvent extends BottomnavEvent{
  final int selectedIndex;

  NavigatorBetweenScreenEvent({required this.selectedIndex});
}