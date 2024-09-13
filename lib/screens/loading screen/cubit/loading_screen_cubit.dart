import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'loading_screen_state.dart';

class LoadingScreenCubit extends Cubit<LoadingScreenState> {
  LoadingScreenCubit() : super(LoadingScreenInitial());
  final get = getIt.get<DataLayer>().authUser;

  checkToken() {
    emit(LoadingState());

    if (get != null) {
      emit(LoggedInState());
    } else {
      emit(NotLoggedInState());
    }
  }
}
