import 'package:get_storage/get_storage.dart';
import 'package:project_judge/models/auth_model.dart';
import 'package:project_judge/network/api_netowrok.dart';

class DataLayer {
  ApiNetowrok api = ApiNetowrok();

  AuthModel? authUser;

  final box = GetStorage();

  DataLayer() {
    loadData();
  }

  saveUserAuth({required AuthModel auth}) {
    authUser = auth;

    box.write("auth", auth.toJson());
  }

  loadData() {
    if (box.hasData("auth")) {
      Map<String, dynamic> loadedData = box.read("auth");
      authUser = AuthModel.fromJson(loadedData);
    }
  }
}
