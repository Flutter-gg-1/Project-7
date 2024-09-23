import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/network/api_netowrok.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ApiNetowrok api = ApiNetowrok();

  HomeCubit() : super(HomeInitial());

  
}
