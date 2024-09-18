import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(StepperState());

  void nextStep() {
    if (state is StepperState) {
      int currentIndex = (state as StepperState).indexStep;
      if (currentIndex < 2) {
        emit(StepperState(
            indexStep: currentIndex + 1,
            presentationDate: (state as StepperState).presentationDate));
      }
    }
  }

  void previousStep() {
    if (state is StepperState) {
      final currentIndex = (state as StepperState).indexStep;
      if (currentIndex > 0) {
        emit(StepperState(
            indexStep: currentIndex - 1,
            presentationDate: (state as StepperState).presentationDate));
      }
    }
  }

  void selectDate(DateTime date) {
    emit(StepperState(
        indexStep:
            (state is StepperState) ? (state as StepperState).indexStep : 0,
        presentationDate: date));
  }
}
