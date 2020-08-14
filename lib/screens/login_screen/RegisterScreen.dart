import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/widgets/HexColor.dart';
import 'package:karyasmk/widgets/LoadingBuilder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthBloc _authBloc;
  AuthBloc _switchScreen;
  bool isLoading = false;
  bool isError = false;
  String emailText;
  String passwordText;

  void doSignIn() async {
    setState(() {
      isLoading = true;
    });

    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(SignIn(email: emailText ?? '', password: passwordText ?? ''));
  }

  void switchScreen() async {
    _switchScreen = BlocProvider.of<AuthBloc>(context);
    _switchScreen.add(AuthSwitchScreenEvent(screen: 'login'));
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  Widget emailField() {
    return TextField(
      onChanged: (value) => emailText = value,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: "Email",
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget passwordField() {
    return TextField(
      onChanged: (value) => passwordText = value,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget registerButton() {
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
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
              height: 100.0,
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
            passwordField(),
            SizedBox(
              height: 35.0,
            ),
            passwordField(),
            SizedBox(
              height: 35.0,
            ),
            registerButton(),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have an account? ',
                  style: style.copyWith(fontSize: 14),
                ),
                InkWell(
                  onTap: () {
                    switchScreen();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      child: Text(
                        'Login here',
                        style: style.copyWith(
                            fontSize: 14.5,
                            color: HexColor('#03a1fc'),
                            fontFamily: 'Roboto'),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
