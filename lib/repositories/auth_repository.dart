import 'package:flutter/foundation.dart';

class AuthRepository {
  // Future<String> authenticate({
  //   @required String username,
  //   @required String password,
  // }) async {
  //   await Future.delayed(Duration(seconds: 1));
  //   return 'token';
  // }
  Future<String> authenticate({
    @required String role,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return role;
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
