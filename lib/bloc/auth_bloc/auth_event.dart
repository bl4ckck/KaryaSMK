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

class SignIn extends AuthEvent {}

class Register extends AuthEvent {}
