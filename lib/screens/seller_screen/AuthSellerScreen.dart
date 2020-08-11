import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';

class AuthSellerScreen extends StatefulWidget {
  const AuthSellerScreen({Key key}) : super(key: key);

  @override
  _AuthSellerScreenState createState() => _AuthSellerScreenState();
}

class _AuthSellerScreenState extends State<AuthSellerScreen> {
  AuthBloc _authBloc;

  void singOutStudent() async {
    var box = Hive.box('session');
    box.put('role', 'general');

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
          'Ini Auth Seller Screen',
          style: TextStyle(fontSize: 50),
        ),
        InkWell(
            onTap: () {
              singOutStudent();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            )),
      ],
    );
  }
}
