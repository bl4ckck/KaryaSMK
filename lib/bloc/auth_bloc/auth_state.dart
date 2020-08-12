part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthlLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final String role;

  AuthLoadedState({this.role});

  @override
  List<Object> get props => [role];
}

class AuthFailureState extends AuthState {
  final String msg;

  AuthFailureState({this.msg});

  @override
  List<Object> get props => [msg];
}

class LoginlLoadingState extends AuthState {}

class LoginlSuccessState extends AuthState {}

class LoginlFailState extends AuthState {}
