import 'package:bloc/bloc.dart';
import 'package:covoit_benin/core_/entities/user.dart';
import 'package:covoit_benin/core_/repositories/auth_repo.dart';
import 'package:covoit_benin/features_/auth/models/email.dart';
import 'package:covoit_benin/features_/auth/models/password.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthIsCreatedAccountClicked>(_isCreatedAccountClickedChanged);

    on<AuthSubmitted>(_onSubmitted);
  }
  final _authRepo = AuthRepo();

  void _isCreatedAccountClickedChanged(
      AuthIsCreatedAccountClicked event, Emitter<AuthState> emit) {
    emit(state.copyWith(
        isCreatedAccountClicked: !state.isCreatedAccountClicked));
  }

  void _onEmailChanged(
    AuthEmailChanged event,
    Emitter<AuthState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isCreatedAccountClicked: state.isCreatedAccountClicked,
        isValid: Formz.validate([state.password, email]),
      ),
    );
  }

  void _onPasswordChanged(
    AuthPasswordChanged event,
    Emitter<AuthState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email]),
      ),
    );
  }

  Future<void> _onSubmitted(
    AuthSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      DUser user = DUser(
          email: state.email.value,
          password: state.password.value,
          avatar: "https://api.miltiavatar.com/${state.email.value}",
          createdAt: DateTime.now());
      late AuthenticationResponse authenticationResponse;
      if (state.isCreatedAccountClicked) {
        authenticationResponse =
            await _authRepo.createUserWithEmailAndPassword(user);
      } else {
        authenticationResponse =
            await _authRepo.signInUserWithEmailAndPassword(user);
      }

      if (authenticationResponse.status == AuthenticationStatus.authenticated) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }
}
