class Auth {
  AuthUser user;

  Auth({this.user});

  factory Auth.fromJson(Map<String, dynamic> parsedJson) {
    return Auth(user: AuthUser.fromJson(parsedJson['user']));
  }
}

class AuthUser {
  String uid;
  String email;
  String nama;
  String phone;
  String type;
  String code;
  String message;

  AuthUser(
      {this.uid,
      this.email,
      this.nama,
      this.phone,
      this.type,
      this.code,
      this.message});

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      uid: json['uid'],
      email: json['email'],
      nama: json['nama'],
      phone: json['phone'],
      type: json['type'],
      code: json['code'],
      message: json['message'],
    );
  }
}
