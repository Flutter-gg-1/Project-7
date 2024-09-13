import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_screen_state.dart';

class FirstScreenCubit extends Cubit<FirstScreenState> {
  FirstScreenCubit() : super(FirstScreenInitial());
}
