import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key, this.isError}) : super(key: key);
  final String isError;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthBloc _authBloc;
  AuthBloc _switchScreen;
  String emailText;
  String passwordText;

  void doSignIn() async {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(SignIn(email: emailText ?? '', password: passwordText ?? ''));
  }

  void switchScreen() async {
    _switchScreen = BlocProvider.of<AuthBloc>(context);
    _switchScreen.add(AuthSwitchScreenEvent(screen: 'register'));
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  Widget emailField() {
    return TextField(
      onChanged: (value) => emailText = value,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Email",
          hintText: "Enter Email Address...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget passwordField() {
    return TextField(
      onChanged: (value) => passwordText = value,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelText: "Password",
          hintText: "Enter Password...",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
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
          switchScreen();
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.black, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isError);
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
            (widget.isError != '')
                ? Text(
                    widget.isError ?? '',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account? ",
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
                        'Sign Up',
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
