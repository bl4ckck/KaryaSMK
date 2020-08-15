part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthlLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final String role, message, page;

  AuthLoadedState({this.role, this.message, this.page});

  @override
  List<Object> get props => [role, message, page];
}

class AuthFailureState extends AuthState {
  final String msg;

  AuthFailureState({this.msg});

  @override
  List<Object> get props => [msg];
}

class AuthSwitchScreenLoadingState extends AuthState {}

class AuthSwitchedScreenState extends AuthState {
  final String screen;

  AuthSwitchedScreenState({this.screen});

  @override
  List<Object> get props => [screen];
}
