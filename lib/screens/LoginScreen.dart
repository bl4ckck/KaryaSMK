import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authBloc;

  void signInStudent() async {
    var box = Hive.box('session');
    box.put('role', 'student');

    var role = box.get('role');

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(FetchSession(role));

    print('Rolenya: $role');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Ini Auth General Screen',
          style: TextStyle(fontSize: 50),
        ),
        InkWell(
            onTap: () {
              signInStudent();
            },
            child: Text(
              'Login as Student',
            )),
      ],
    );
  }
}
