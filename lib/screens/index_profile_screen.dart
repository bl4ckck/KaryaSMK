import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/screens/login_screen/index_login_screen.dart';
import 'package:karyasmk/screens/seller_screen/AuthSellerScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';
import 'package:neumorphic/neumorphic.dart';

class IndexProfileScreen extends StatefulWidget {
  IndexProfileScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<IndexProfileScreen> {
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
  }

  Widget customAppBar(BuildContext ctx) {
    return AppBar(
      backgroundColor: NeuTheme.of(ctx).backgroundColor,
      elevation: 0,
      leading: IconButton(
        iconSize: 27,
        color: Colors.black,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(ctx, true);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context),
        backgroundColor: NeuTheme.of(context).backgroundColor,
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthlLoadingState) {
            return LoadingBuilder();
          } else if (state is AuthLoadedState) {
            if (state.role == 'student') {
              return AuthSellerScreen();
            }
            // else if (state.role == 'general' || state.role == null) {
            //   return IndexLoginScreen();
            // }
            return IndexLoginScreen();
          } else if (state is AuthFailureState) {
            return IndexLoginScreen();
          }

          return IndexLoginScreen();
        }));
  }
}
