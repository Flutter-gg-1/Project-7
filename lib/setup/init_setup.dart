import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_judge/data_layer/data_layer.dart';
import 'package:project_judge/screens/myproject/bloc/bloc_project_bloc.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await GetStorage.init();
getIt.registerSingleton<ProjectBloc>(ProjectBloc());

  getIt.registerSingleton<DataLayer>(DataLayer());
}
