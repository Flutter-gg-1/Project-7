import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'loading_screen_state.dart';

class LoadingScreenCubit extends Cubit<LoadingScreenState> {
  LoadingScreenCubit() : super(LoadingScreenInitial());
  final userAuth = getIt.get<DataLayer>().authUser;

  Future<void> checkToken() async {
    await Future.delayed(const Duration(seconds: 2));

    if (userAuth != null) {
      await getIt.get<DataLayer>().getProjectInfo();

      emit(LoggedInState());
    } else {
      emit(NotLoggedInState());
    }
  }
}
