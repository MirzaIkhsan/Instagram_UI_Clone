import 'package:dio/dio.dart';

import '../models/user.dart';

class UserService {
  var dio = Dio();

  final String baseUrl = 'http://10.0.2.2:8000/api/users';

  dynamic getFromAPIByIdentity(String email, String password) async {
    final String url = '$baseUrl/login';

    try {
      var response = await dio.post(url, queryParameters: {
        'email': email,
        'password': password,
      });
      return User.fromJson(response.data);
    } catch (e) {
      return 400;
    }
  }

  dynamic postToAPI(
    String username,
    String email,
    String password,
  ) async {
    final String url = '$baseUrl';

    try {
      var response = await dio.post(url, queryParameters: {
        'name': username,
        'email': email,
        'password': password,
      });
      if(response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
