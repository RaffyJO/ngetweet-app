import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngetweet/models/user_model.dart';
import 'package:ngetweet/services/auth_service.dart';
import 'package:ngetweet/shared/values.dart';

class UserService {
  Future<List<User>> getRecentUsers() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/transfer_histories',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<User>.from(
          jsonDecode(res.body)['data'].map(
            (user) => User.fromJson(user),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> getUsersByUsername(String username) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/users/$username',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<User>.from(
          jsonDecode(res.body).map(
            (user) => User.fromJson(user),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
