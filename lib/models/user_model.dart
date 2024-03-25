import 'package:ngetweet/models/comment_model.dart';
import 'package:ngetweet/models/like_model.dart';
import 'package:ngetweet/models/tweet_model.dart';

class User {
  int id;
  String name;
  String nickname;
  String email;
  String? avatar;
  DateTime? emailVerifiedAt;
  String password;
  String? token;
  List<Tweet>? tweets;
  List<Comment>? comments;
  List<Like>? likes;

  User({
    required this.id,
    required this.name,
    required this.nickname,
    required this.email,
    this.avatar,
    this.emailVerifiedAt,
    required this.password,
    this.token,
    this.tweets,
    this.comments,
    this.likes,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['data']['id'],
        name: json['data']['name'],
        nickname: json['data']['nickname'],
        email: json['data']['email'],
        avatar: json['data']['avatar'],
        emailVerifiedAt: DateTime.parse(json['data']['email_verified_at']),
        password: json['data']['password'],
        token: json['token'],
        tweets: json['data']['tweets'],
        comments: json['data']['comments'],
        likes: json['data']['likes'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  User copyWith({
    String? name,
    String? nickname,
    String? email,
    String? password,
    String? token,
    DateTime? emailVerifiedAt,
    List<Tweet>? tweets,
    List<Comment>? comments,
    List<Like>? likes,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      nickname: nickname ?? this.nickname,
      email: email ?? this.email,
      avatar: avatar,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      password: password ?? this.password,
      token: token ?? this.token,
      tweets: tweets ?? this.tweets,
      comments: comments ?? this.comments,
      likes: likes ?? this.likes,
    );
  }
}
