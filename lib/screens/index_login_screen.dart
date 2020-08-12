import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/screens/LoginScreen.dart';
import 'package:karyasmk/screens/seller_screen/AuthSellerScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class IndexLoginScreen extends StatefulWidget {
  IndexLoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<IndexLoginScreen> {
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    loadBox();
  }

  void loadBox() async {
    final box = await Hive.openBox('sessionUser');

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(FetchSession(box.isNotEmpty ? box.getAt(0).type : 'general'));

    print('Rolenya:' + box.getAt(0).nama);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthlLoadingState) {
            return LoadingBuilder();
          } else if (state is AuthLoadedState) {
            if (state.role == 'student') {
              return AuthSellerScreen();
            } else if (state.role == 'general' || state.role == null) {
              return LoginScreen();
            }
          } else if (state is AuthFailureState) {
            return Center(child: Text('Failed to load data :('));
          }

          return Container();
        }));
  }
}
