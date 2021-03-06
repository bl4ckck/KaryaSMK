import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:karyasmk/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepo;

  AuthBloc(this._authRepo) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is FetchSession) {
      yield AuthlLoadingState();
      try {
        final String role = await _authRepo.authenticate(role: event.role);
        yield AuthLoadedState(role: role);
      } catch (e) {
        yield AuthFailureState(msg: e.toString());
      }
    }

    if (event is SignIn) {
      yield AuthlLoadingState();
      try {
        final userData =
            await _authRepo.login(email: event.email, password: event.password);
        yield AuthLoadedState(role: userData, message: userData); //Versi 2
        // yield AuthLoadedState(role: userData); //Versi 1
      } catch (e) {
        yield AuthFailureState(msg: e.toString());
      }
    }

    if (event is Register) {
      yield AuthlLoadingState();
      try {
        final userData = await _authRepo.register(
            email: event.email,
            password: event.password,
            nama: event.nama,
            phone: event.phone,
            type: event.type);
        yield AuthLoadedState(role: userData, message: userData, page: 'register');
      } catch (e) {
        yield AuthFailureState(msg: e.toString());
      }
    }

    if (event is AuthSwitchScreenEvent) {
      yield AuthSwitchScreenLoadingState();

      yield AuthSwitchedScreenState(screen: event.screen);
    }
  }
}
