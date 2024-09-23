import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  ApiNetowrok api = ApiNetowrok();
  DateTime? EndDate;
  String? userId;
  int? canEdit = 0;
  String? edit;
  AddProjectCubit() : super(StepperState());

  void saveDate() {
    emit(UpdateState());
  }

  void saveEditOption(int value) {
    canEdit = value;
    emit(UpdateState()); // Emit a state if needed
  }

  void createAccountMethod() async {
    emit(LoadingState());
    try {
      canEdit == 0
          ? edit = 'true'
          : canEdit == 1
              ? edit = 'false'
              : edit == 'true';

      await api.createProject(
          token: getIt.get<DataLayer>().authUser!.token,
          userID: userId!,
          date: DateFormat('dd/MM/yyyy').format(EndDate!),
          edit: edit!);
      emit(SuccessState());
      
    } on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
  }

  void nextStep() {
    if (state is StepperState) {
      int currentIndex = (state as StepperState).indexStep;
      if (currentIndex < 2) {
        emit(StepperState(
            indexStep: currentIndex + 1));
      }
    }
  }


  void selectDate(DateTime date) {
    emit(StepperState(
        indexStep:
            (state is StepperState) ? (state as StepperState).indexStep : 0,
       ));
  }
}
