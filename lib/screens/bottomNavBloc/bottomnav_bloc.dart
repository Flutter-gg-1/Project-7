import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnav_event.dart';
part 'bottomnav_state.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  int currentIndex = 0;
  BottomnavBloc() : super(BottomnavInitial()) {
    on<BottomnavEvent>((event, emit) {});
    on<NavigatorBetweenScreenEvent>((event, emit) {
      currentIndex = event.selectedIndex;
      emit(IndexChangeState(index: currentIndex));
    });
  }
}
