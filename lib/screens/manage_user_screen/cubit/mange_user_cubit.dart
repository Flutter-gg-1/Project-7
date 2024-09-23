import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mange_user_state.dart';

class MangeUserCubit extends Cubit<MangeUserState> {
  MangeUserCubit() : super(MangeUserInitial());


  void switchButton() {
    if (state is SwitchButtonState) {
      final currentState = state as SwitchButtonState;
      emit(SwitchButtonState(isSwitched: !currentState.isSwitched));
    }
  }
}
