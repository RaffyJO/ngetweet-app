import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngetweet/models/tweet_model.dart';
import 'package:ngetweet/services/auth_service.dart';
import 'package:ngetweet/shared/values.dart';

class TweetService {
  Future<String> addTweet(String body, String? image) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/tweets',
        ),
        body: jsonEncode({
          'body': body,
          'image': image,
        }),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['message'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tweet>> getTweet() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse(
          '$baseUrl/tweets',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return List<Tweet>.from(
          jsonDecode(res.body).map(
            (tweet) => Tweet.fromJson(tweet),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Tweet>> getAllTweet() async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/tweets/all',
        ),
      );

      if (res.statusCode == 200) {
        return List<Tweet>.from(
          jsonDecode(res.body)['data'].map(
            (tweet) => Tweet.fromJson(tweet),
          ),
        );
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> deleteTweet(int id) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.post(
        Uri.parse(
          '$baseUrl/tweets/$id/tweet',
        ),
        headers: {
          'Authorization': token,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['message'];
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
