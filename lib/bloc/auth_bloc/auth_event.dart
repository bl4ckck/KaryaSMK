part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class FetchSession extends AuthEvent {
  final String role;
  FetchSession(this.role);
}

class SignIn extends AuthEvent {
  final String email, password;
  SignIn({this.email, this.password});
}

class Register extends AuthEvent {}
