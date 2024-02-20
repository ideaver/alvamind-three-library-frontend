import 'package:jwt_decode/jwt_decode.dart';

class Auth {
  String? userId;
  String? email;
  String accessToken;
  String refreshToken;

  Auth({
    this.userId,
    this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory Auth.fromJson(Map<String, dynamic> data) {
    final jwt = Jwt.parseJwt(data["accessToken"]);

    return Auth(
      userId: jwt["id"],
      email: jwt["email"],
      accessToken: data["accessToken"],
      refreshToken: data["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": userId,
        "email": email,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
