import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karyasmk/bloc/auth_bloc/auth_bloc.dart';
import 'package:karyasmk/widgets/HexColor.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key, this.isError}) : super(key: key);
  final String isError;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthBloc _authBloc;
  AuthBloc _switchScreen;
  String emailText;
  String passwordText;
  String namaText;
  String phoneText;
  String typeText;
  String _radioValue = 'buyer';

  final _formKey = GlobalKey<FormState>();

  void doSignUp() async {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _authBloc.add(Register(
        email: emailText,
        password: passwordText,
        nama: namaText,
        phone: phoneText,
        type: typeText ?? 'buyer'));
  }

  void switchScreen() async {
    _switchScreen = BlocProvider.of<AuthBloc>(context);
    _switchScreen.add(AuthSwitchScreenEvent(screen: 'login'));
  }

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'buyer':
          typeText = value;
          break;
        case 'student':
          typeText = value;
          break;
        default:
          typeText = null;
      }
    });
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);

  bool formatEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    if (emailValid) return true;
    return false;
  }

  Widget emailField() {
    return TextFormField(
      onChanged: (value) => emailText = value,
      style: style,
      validator: (value) {
        if (value.isEmpty) {
          return "Email can't be empty";
        } else if (formatEmail(value) == false) {
          return 'The email address is badly formatted';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          hintText: "Email",
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget passwordField() {
    return TextFormField(
      onChanged: (value) => passwordText = value,
      obscureText: true,
      style: style,
      validator: (value) {
        if (value.isEmpty) {
          return "Password can't be empty";
        } else if (value.length < 6) {
          return 'Length must at least 6 characters';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget namaField() {
    return TextFormField(
      onChanged: (value) => namaText = value,
      style: style,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          isDense: true,
          hintText: "Full Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
    );
  }

  Widget phoneField() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Text(
            '+62',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17),
          )),
          Expanded(
            flex: 4,
            child: TextFormField(
              onChanged: (value) => phoneText = value,
              style: style,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter phone number';
                } else if (value.length < 9) {
                  return 'Length must at least 9 characters';
                } else if (value.length > 12) {
                  return 'Length must less than 12 characters';
                } else if (value.contains('+')) {
                  return 'example: 821533773';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  isDense: true,
                  hintText: "Number Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget typeField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Radio(
          value: 'buyer',
          onChanged: radioButtonChanges,
          groupValue: _radioValue,
        ),
        new Text(
          'Buyer',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          value: 'student',
          onChanged: radioButtonChanges,
          groupValue: _radioValue,
        ),
        new Text(
          'Seller',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
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
          if (_formKey.currentState.validate()) {
            doSignUp();
          }
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
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(36),
        child: Form(
          key: _formKey,
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
              SizedBox(height: 25.0),
              namaField(),
              SizedBox(height: 25.0),
              phoneField(),
              SizedBox(height: 25.0),
              typeField(),
              SizedBox(height: 25.0),
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
      ),
    );
  }
}
