import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authBloc;
  bool isLoading = false;
  bool isError = false;
  String emailText;
  String passwordText;

  // void signInStudent(SessionUser user) async {
  //   _authBloc = BlocProvider.of<AuthBloc>(context);
  //   _authBloc.add(SignIn(email: , password: ''));

  //   print('Rolenya12: coba login');
  // }

  // void failSignIn() async {
  //   _authBloc = BlocProvider.of<AuthBloc>(context);
  //   _authBloc.add(FetchSession('general'));

  //   print('Rolenya: general');
  // }
  // void signInStudent() async {
  //   final box = await Hive.openBox('sessionUser');

  //   var user = SessionUser(
  //       '13524y6t', 'student@karyasmk.com', 'student namanya', 'student');
  //   box.add(user);

  //   var role = box.getAt(0).type;

  //   _authBloc = BlocProvider.of<AuthBloc>(context);
  //   _authBloc.add(FetchSession(role));

  //   print('Rolenya: $role');
  // }

  void doSignIn() async {
    setState(() {
      isLoading = true;
    });

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(SignIn(email: emailText ?? '', password: passwordText ?? ''));
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  @override
  Widget build(BuildContext context) {
    Widget emailField() {
      return TextField(
        onChanged: (value) => emailText = value,
        // onSubmitted: (value) {
        //   value = emailText;
        // },
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      );
    }

    Widget passwordField() {
      return TextField(
        onChanged: (value) => passwordText = value,
        obscureText: true,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
      );
    }

    Widget loginButton() {
      return Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.orangeAccent,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            doSignIn();
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );
    }

    Widget registerButton() {
      return Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(30.0),
        color: HexColor('#e1e3e5'),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            doSignIn();
          },
          child: Text("Register",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
      );
    }

    if (isLoading) {
      setState(() {
        isLoading = false;
        isError = true;
      });
      return LoadingBuilder();
    }

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 120.0,
              child: Image.asset(
                "assets/images/karya_logo.jpg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 45.0),
            (isError)
                ? Text(
                    'Email atau password Anda salah!',
                    style: TextStyle(color: Colors.red),
                  )
                : SizedBox(height: 0.0),
            SizedBox(height: 25.0),
            emailField(),
            SizedBox(height: 25.0),
            passwordField(),
            SizedBox(
              height: 35.0,
            ),
            loginButton(),
            SizedBox(
              height: 15.0,
            ),
            registerButton(),
          ],
        ),
      ),
    );
  }
}
