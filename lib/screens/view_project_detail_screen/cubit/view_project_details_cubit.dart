import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/setup/init_setup.dart';

import '../../../network/api_netowrok.dart';

part 'view_project_details_state.dart';

class ViewProjectDetailsCubit extends Cubit<ViewProjectDetailsState> {
  ViewProjectDetailsCubit() : super(ViewProjectDetailsInitial());

  ApiNetowrok api = ApiNetowrok();

  loadProjectDetail() async {
    emit(LoadingState());
    try{
      getIt.get<DataLayer>().projectInfo = await api.getProjectDetails();
      emit(SuccessState());
    }on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
    
  }
}
