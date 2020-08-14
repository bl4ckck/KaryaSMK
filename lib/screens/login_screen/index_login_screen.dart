import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/screens/login_screen/LoginScreen.dart';
import 'package:karyasmk/screens/login_screen/RegisterScreen.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class IndexLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSwitchScreenLoadingState) {
        return LoadingBuilder();
      } else if (state is AuthSwitchedScreenState) {
        if (state.screen == 'register') {
          return RegisterScreen();
        }
      }
      return LoginScreen();
    });
  }
}
