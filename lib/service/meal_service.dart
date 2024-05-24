import 'package:crud_restapi/model/login_mode.dart';
import 'package:crud_restapi/model/meal_model.dart';
import 'package:dio/dio.dart';

String token = '';
Future<bool> login(LoginMode login) async {
  Dio dio = Dio();
  Response response = await dio.post(
      "https://food-api-omega.vercel.app/api/v1/chef/signin",
      data: login.toMap());

  if (response.statusCode == 202) {
    token = response.data['token'];
    return true;
  } else {
    return false;
  }
}

Future<List<MealModel>> getAllMeal() async {
  Dio dio = Dio();
  Response response = await dio.get(
    "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
    options: Options(headers: {'token': "FOODAPI ${token}"}),
  );
  print(response);
  List<MealModel> meals = [];
  for (var i = 0; i < response.data['meals'].length; i++) {
    MealModel meal = MealModel.fromMap(response.data['meals'][i]);
    meals.add(meal);
  }
  return meals;
}
