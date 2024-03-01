// ignore: depend_on_referenced_packages
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:covoit_benin/cores/repository/auth_repository/auth_repository.dart';
import 'package:covoit_benin/features/auth/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginPhoneChanged>(_phoneChanged);
    on<LoginPasswordChanged>(_passwordChanged);
    on<LoginSubmitted>(_submit);
  }

  final AuthenticationRepository _auth = AuthenticationRepository();

  void _phoneChanged(LoginPhoneChanged event, Emitter<LoginState> emit) {
    final phone = Phone.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([
          state.password,
          phone,
        ]),
      ),
    );
  }

  void _passwordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.phone,
          password,
        ]),
      ),
    );
  }

  Future<void> _submit(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 2));

      AuthenticationStatus authenticationStatus =
          await _auth.login(state.phone.value, state.password.value);
      if (authenticationStatus == AuthenticationStatus.authenticated) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
