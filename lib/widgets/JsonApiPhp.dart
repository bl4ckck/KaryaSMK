import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonApiPhp extends StatefulWidget {
  @override
  _JsonApiPhpState createState() => _JsonApiPhpState();
}

class _JsonApiPhpState extends State<JsonApiPhp> {
  bool loading = true;
  final String url = 'https://www.christian-dogma.com/android-index.php';
  var client = http.Client();
  List<User> users = List<User>();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    http.Response response = await client.get(url);
    if (response.statusCode == 200) {
      // Connection Ok
      List responseJson = json.decode(response.body);
      responseJson.map((m) => users.add(new User.fromJson(m))).toList();
      setState(() {
        loading = false;
      });
    } else {
      throw ('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: loading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(users[index].username),
                      ),
                    );
                  },
                )),
    );
  }
}

class User {
  final String id;
  final String name;
  final String username;
  final String email;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
    );
  }
}
