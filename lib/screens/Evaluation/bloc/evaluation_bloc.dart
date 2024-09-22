import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:project_management_app/networking/api_networking.dart';

part 'evaluation_event.dart';
part 'evaluation_state.dart';

class EvaluationBloc extends Bloc<EvaluationEvent, EvaluationState> {
  final ApiNetworking api = ApiNetworking();
  List<double> sliderValues = List.generate(6, (index) => 0.0);
  String comment = '';

  EvaluationBloc() : super(EvaluationInitial()) {
    on<UpdateSliderValue>(updateSliderValue);
    on<UpdateComment>(updateComment);
    on<SendRatingEvent>(sendRating);
  }

  Future<void> updateSliderValue(UpdateSliderValue event, Emitter<EvaluationState> emit) async {
    sliderValues[event.index] = event.value;
    emit(EvaluationUpdatedState(sliderValues: sliderValues, comment: comment));
  }

  Future<void> updateComment(UpdateComment event, Emitter<EvaluationState> emit) async {
    comment = event.comment;
    emit(EvaluationUpdatedState(sliderValues: sliderValues, comment: comment));
  }

  Future<void> sendRating(SendRatingEvent event, Emitter<EvaluationState> emit) async {
    try {
      await api.rateProject(
        token: event.token,
        projectId: event.projectId,
        idea: sliderValues[0].round(),
        design: sliderValues[1].round(),
        tools: sliderValues[2].round(),
        practices: sliderValues[3].round(),
        presentation: sliderValues[4].round(),
        investment: sliderValues[5].round(),
        note: comment,
      );
      emit(EvaluationSuccessfulState(sliderValues: sliderValues, comment: comment));
    } catch (e) {
      log('Failed');
    }
  }
}
