import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:ngetweet/models/params/login_model.dart';
import 'package:ngetweet/models/params/register_model.dart';
import 'package:ngetweet/models/user_model.dart';
import 'package:ngetweet/shared/values.dart';

class AuthService {
  Future<User> login(LoginModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/login',
        ),
        body: jsonEncode(
          data.toJson(),
        ),
      );

      if (res.statusCode == 200) {
        User user = User.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> register(RegisterModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/register',
        ),
        body: jsonEncode(
          data.toJson(),
        ),
      );

      if (res.statusCode == 200) {
        User user = User.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        await storeCredentialToLocal(user);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      final token = await getToken();

      final res = await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        await clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(User user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final LoginModel data = LoginModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = value;
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    storage.deleteAll();
  }
}
