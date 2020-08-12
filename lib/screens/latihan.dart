import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:karyasmk/models/Auth.dart';

class Latihan extends StatefulWidget {
  const Latihan({Key key}) : super(key: key);

  @override
  _LatihanState createState() => _LatihanState();
}

class _LatihanState extends State<Latihan> {
  @override
  void initState() {
    super.initState();
    getAuth();
  }

  Future<List<dynamic>> getAuth() async {
    Dio dio = new Dio();
    Response response;
    response = await dio.post('http://localhost:5000/api/v1/auth',
        data: {"email": "pembeli@karyasmk.com", "password": "1karyasmk"});

    // if (response.statusCode == 200) {
    var data = response.data;
    // final List<AuthListModel> list = Auth.fromJson(data).authList;

    final jsonResponse = json.decode(response.toString());

    Auth shape = new Auth.fromJson(jsonResponse);

    // listAuth = list;

    print(shape.user.uid);
    // print(list);
    return null;
    // }
    // return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('listAuth.length')),
    );
  }
}
