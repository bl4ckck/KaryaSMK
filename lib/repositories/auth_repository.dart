import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/constants/base_url.dart';
import 'package:karyasmk/helper/hive/session_user.dart';
import 'package:karyasmk/models/Auth.dart';

class AuthRepository {
  // Future<String> authenticate({
  //   @required String username,
  //   @required String password,
  // }) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return 'token';
  // }

  final dio = new Dio();

  Future<String> authenticate({
    @required String role,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return role;
  }

  Future<String> login({
    @required String email,
    @required String password,
  }) async {
    Response response;
    response = await dio
        .post(BaseUrl + 'auth', data: {"email": email, "password": password});

    final jsonResponse = json.decode(response.toString());

    Auth data = new Auth.fromJson(jsonResponse);

    if (data.user.code == 'success') {
      var user = SessionUser(data.user.uid, data.user.email, data.user.nama,
          data.user.phone, data.user.type);

      final box = await Hive.openBox('sessionUser');
      box.add(user);

      return data.user.type;
    } else if (data.user.code == 'error') return data.user.message;

    return 'general';
  }

  Future<String> register(
      {@required String email,
      @required String password,
      @required String nama,
      @required String phone,
      @required String type}) async {
    Response response;
    response = await dio.post(BaseUrl + 'auth/register', data: {
      "email": email,
      "password": password,
      "nama": nama,
      "phone": phone,
      "type": type,
    });

    final jsonResponse = json.decode(response.toString());

    Auth data = new Auth.fromJson(jsonResponse);

    if (data.user.code == 'success') {
      var user = SessionUser(data.user.uid, data.user.email, data.user.nama,
          data.user.phone, data.user.type);

      final box = await Hive.openBox('sessionUser');
      box.add(user);

      return data.user.type;
    } else if (data.user.code == 'error') return data.user.message;

    return 'general';
  }
}
