import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'loading_screen_state.dart';

class LoadingScreenCubit extends Cubit<LoadingScreenState> {
  LoadingScreenCubit() : super(LoadingScreenInitial());
  final userAuth = getIt.get<DataLayer>().authUser;

  Future<void> checkToken() async {
    print("----------here i am");
    await Future.delayed(Duration.zero);
    emit(LoadingState());

    if (userAuth != null) {
      emit(LoggedInState());
    } else {
      emit(NotLoggedInState());
    }
  }
}
