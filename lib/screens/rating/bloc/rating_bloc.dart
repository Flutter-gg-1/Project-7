import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  TextEditingController noteController = TextEditingController();
  double idea = 2,
      design = 2,
      tools = 2,
      practice = 2,
      presintation = 2,
      invesment = 2;
  RatingBloc() : super(RatingInitial()) {
    on<RatingEvent>((event, emit) {});
    on<RatingEvent>((event, emit) {
      try {} on DioException catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
  }
}
