import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import '../data_layer/data_layer.dart';

final locator = GetIt.instance;
Future<void> setup() async {
  await GetStorage.init();
  locator.registerSingleton<DataLayer>(DataLayer());
  await dotenv.load(fileName: ".env");
}
