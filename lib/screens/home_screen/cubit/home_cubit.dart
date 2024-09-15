import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/network/api_netowrok.dart';
import 'package:project_judge/setup/init_setup.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ApiNetowrok api = ApiNetowrok();

  HomeCubit() : super(HomeInitial());

  checkCurrentUser() async {
    await Future.delayed(Duration(seconds: 2));
    getIt.get<DataLayer>().userInfo =
        await api.getUserProfile(token: getIt.get<DataLayer>().authUser!.token);
  }
}
