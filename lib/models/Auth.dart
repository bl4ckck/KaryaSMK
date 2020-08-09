class Auth {
  AuthUser user;

  Auth({this.user});

  factory Auth.fromJson(Map<String, dynamic> parsedJson) {
    return Auth(user: AuthUser.fromJson(parsedJson['user']));
  }
}

class AuthUser {
  String uuid;
  String email;

  AuthUser({this.uuid, this.email});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(uuid: json['uuid'], email: json['email']);
  }
}
