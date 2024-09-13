import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_management_app/screens/Home/home_screen.dart';
import 'package:project_management_app/screens/Project/evaluation_screen.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  List<Widget> views = [
    HomeScreen(),
    EvaluationScreen(),
    Container(color: Colors.pink, child: Center(child: Text("Settings"))),
    Container(color: Colors.green, child: Center(child: Text("Profile"))),
  ];

  int currentIndex = 0;

  BottomNavBloc() : super(BottomNavInitial()) {
    on<ChangeEvent>(changeMethod);
  }

  FutureOr<void> changeMethod(ChangeEvent event, Emitter<BottomNavState> emit) {
    currentIndex = event.index;
    emit(SuccessChangeViewState(currentIndex));
  }
}
