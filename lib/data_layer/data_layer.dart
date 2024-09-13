import 'package:get_storage/get_storage.dart';
import 'package:project_judge/models/auth_model.dart';
import 'package:project_judge/network/api_netowrok.dart';

class DataLayer {
  ApiNetowrok api = ApiNetowrok();

  AuthModel? authUser;

  final box = GetStorage();

  saveUserAuth({required AuthModel auth}) {
    authUser = auth;

    box.write("auth", authUser);
  }

  loadData(){
    if (box.hasData("auth")){
      authUser = box.read("auth");
    }
  }
}
