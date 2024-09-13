import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';
import 'package:tuwaiq_project/services/setup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final language = languageLocaitor.get<LanguageLayer>();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LanguageChangeEvent>((event, emit) {
      language.isArabic = !language.isArabic;
      emit(ArabicState(isArabic: language.isArabic));
    });
  }
}
