import 'package:get_storage/get_storage.dart';
import 'package:tuwaiq_project/models/user_model.dart';

class AuthLayerData {
  // change later
  UserModel? auth = UserModel.fromJson({});
  final box = GetStorage();

  AuthLayerData() {
    loadDataAuth();
  }

  Future<void> saveAuth({required UserModel authData}) async {
    auth = authData;
    await box.write("auth", authData.toJson());
  }

  Future<void> loadDataAuth() async {
    if (box.hasData('auth')) {
      auth = UserModel.fromJson(
          Map.from(await box.read("auth")).cast<String, dynamic>());
    }
  }

  Future<void> logOut() async {
    box.erase();
    auth = null;
  }
}
