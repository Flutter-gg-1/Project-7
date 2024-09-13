import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tuwaiq_project/data_layer/language_layer.dart';

final languageLocaitor = GetIt.instance;

Future<void> setup() async{
  await GetStorage.init();
  languageLocaitor.registerSingleton<LanguageLayer>(LanguageLayer());
}