import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_management_app/data_layer/data_layer.dart';
import 'package:project_management_app/services/setup.dart';

part 'load_state.dart';

class LoadTokenCubit extends Cubit<LoadTokenState> {
  LoadTokenCubit() : super(LoadTokenInitial());

  checkLogin() async {
    await Future.delayed(Duration.zero);
    log('${locator.get<DataLayer>().auth}');
    if (locator.get<DataLayer>().auth != null) {
      emit(LoggedInUserState());
    } else {
      log('${locator.get<DataLayer>().auth}');
      emit(LoggedOutUserState());
    }
  }
}
