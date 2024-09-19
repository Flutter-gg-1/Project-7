import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_rating_event.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_rating_state.dart';


class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc()
      : super(RatingState(
          ideaRating: 1,
          designRating: 1,
          toolsRating: 1,
          practicesRating: 1,
          presentationRating: 1,
          investmentRating: 1,
        )) {
    on<UpdateRating>((event, emit) {
      switch (event.category) {
        case 'Idea':
          emit(state.copyWith(ideaRating: event.value));
          break;
        case 'Design':
          emit(state.copyWith(designRating: event.value));
          break;
        case 'Tools':
          emit(state.copyWith(toolsRating: event.value));
          break;
        case 'Practices':
          emit(state.copyWith(practicesRating: event.value));
          break;
        case 'Presentation':
          emit(state.copyWith(presentationRating: event.value));
          break;
        case 'Investment':
          emit(state.copyWith(investmentRating: event.value));
          break;
        default:
          break;
      }
    });
  }
}
