class RegisterModel {
  final String? name;
  final String? nickname;
  final String? email;
  final String? password;
  final String? avatar;

  RegisterModel({
    this.name,
    this.nickname,
    this.email,
    this.password,
    this.avatar,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nickname': nickname,
      'email': email,
      'password': password,
      'avatar': avatar ?? '',
    };
  }

  RegisterModel copyWith({String? avatar, String? ktp}) => RegisterModel(
        name: name,
        nickname: nickname,
        email: email,
        password: password,
        avatar: avatar ?? this.avatar,
      );
}
