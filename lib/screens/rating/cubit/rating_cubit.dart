import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  ApiNetowrok api = ApiNetowrok();
  double ideaRating = 1;
  double designRating = 1;
  double toolsRating = 1;
  double practicesRating = 1;
  double presentationRating = 1;
  double investmentRating = 1;
  TextEditingController notesController = TextEditingController();
  RatingCubit() : super(RatingInitial());

  submitRating({required String pID}) async {
    emit(LoadingState());
    try {
      await api.ratePageMethod(
          token: getIt.get<DataLayer>().authUser!.token,
          projectID: pID,
          idea: ideaRating.toInt(),
          design: designRating.toInt(),
          tools: toolsRating.toInt(),
          practices: practicesRating.toInt(),
          presentation: presentationRating.toInt(),
          investment: investmentRating.toInt(),
          note: notesController.text);
      emit(SuccessState());
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }
}
