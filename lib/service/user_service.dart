import 'package:crud_restapi/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = "https://664dcb37ede9a2b55654e96c.mockapi.io/api/v1/users";

  Future<List<UserModel>> getAllUser() async {
    response = await dio.get(baseUrl);
    List<UserModel> users = [];
    for (var i = 0; i < response.data.length; i++) {
      UserModel user = UserModel.fromJson(response.data[i]);
      users.add(user);
    }
    return users;
  }

  Future<UserModel> getOneUser() async {
    response = await dio.get(baseUrl + '/1');
    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }

  Future<bool> createUser(UserModel user) async {
    response = await dio.post(baseUrl, data: user.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> updateUser(UserModel user, String id) {}

  // Future<bool> deleteUser(String id) {}
}
