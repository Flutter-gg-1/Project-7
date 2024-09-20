import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_project_details_state.dart';

class ViewProjectDetailsCubit extends Cubit<ViewProjectDetailsState> {
  ViewProjectDetailsCubit() : super(ViewProjectDetailsInitial());

  loadProjectDetail(){
    emit(LoadingState());

    try{
      emit(SuccessState());
    }on FormatException catch (e) {
      emit(ErrorState(msg: e.message));
    } catch (e) {
      emit(ErrorState(msg: e.toString()));
    }
    
  }
}
