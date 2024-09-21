import 'package:get_storage/get_storage.dart';
import 'package:project_judge/models/auth_model.dart';
import 'package:project_judge/models/user_model.dart';
import 'package:project_judge/network/api_netowrok.dart';

class DataLayer {
  ApiNetowrok api = ApiNetowrok();

  AuthModel? authUser;
  UserModel? userInfo;

  final box = GetStorage();

  DataLayer() {
    // box.erase();
    loadData();
  }

  saveUserAuth({required AuthModel auth}) {
    authUser = auth;

    box.write("auth", auth.toJson());
  }

  Future<void> getUserr() async {
    userInfo = await api.getUserProfile(token: authUser!.token);
    print(userInfo);
     box.write("user", userInfo!.toJson());
  }

  
  loadData() {
    if (box.hasData("auth")) {
      Map<String, dynamic> loadedData = box.read("auth");
      authUser = AuthModel.fromJson(loadedData);
    }
        if (box.hasData("user")) {
      Map<String, dynamic> loadedData = box.read("user");
      userInfo = UserModel.fromJson(loadedData);
    }
  }
}
