import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/services/setup.dart';

part 'splach_state.dart';

class SplachCubit extends Cubit<SplachState> {
  SplachCubit() : super(SplachInitial());

  checkLogin() async {
    await Future.delayed(Duration.zero);
    if (authLocator.get<AuthLayerData>().auth != null) {
      emit(LoginUserState());
    } else {
      emit(NotLoginUserState());
    }
  }
}
