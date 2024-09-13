import 'package:get_it/get_it.dart';
import '../data_layer/data_layer.dart';


final locator = GetIt.instance;
setup() async {
  locator.registerSingleton<DataLayer>(DataLayer());
}