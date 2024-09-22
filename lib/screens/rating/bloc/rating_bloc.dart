import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tuwaiq_project/networking/networking_api.dart';

part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final api = NetworkingApi();
  TextEditingController noteController = TextEditingController();
  double idea = 2,
      design = 2,
      tools = 2,
      practices = 2,
      presentation = 2,
      investment = 2;
  RatingBloc() : super(RatingInitial()) {
    on<RatingEvent>((event, emit) {});
    on<CompleteRatingEvent>((event, emit) async {
      try {
        emit(LoadingState());
        await api.ratingProject(
            projectId: event.projectId,
            note: noteController.text.trim(),
            idea: idea,
            design: design,
            tools: tools,
            practices: practices,
            presentation: presentation,
            investment: investment);
        emit(SucsessState(msg: 'Thank you'));
        noteController.clear();
      } on DioException catch (erorr) {
        emit(ErrorState(msg: '$erorr'));
      } catch (e) {
        emit(ErrorState(msg: '$e'));
      }
    });
  }
}
