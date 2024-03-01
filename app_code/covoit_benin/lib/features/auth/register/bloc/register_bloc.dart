// ignore: depend_on_referenced_packages
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:covoit_benin/cores/models/user.dart';
import 'package:covoit_benin/cores/repository/auth_repository/auth_repository.dart';
import 'package:covoit_benin/features/auth/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterEventInitial>(_init);
    on<RegisterNomChanged>(_nomChanged);
    on<RegisterPrenomChanged>(_prenomChanged);
    on<RegisterEmailChanged>(_emailChanged);
    on<RegisterPhoneChanged>(_phoneChanged);
    on<RegisterPasswordChanged>(_passwordChanged);
    on<RegisterGenreChanged>(_genreChanged);
    on<RegisterSubmitted>(_submit);
  }

  final AuthenticationRepository _auth = AuthenticationRepository();

  void _init(RegisterEventInitial event, Emitter<RegisterState> emit) {}

  Future<void> _submit(
      RegisterSubmitted event, Emitter<RegisterState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      await Future.delayed(const Duration(seconds: 2));

      User user = User(
          nom: state.nom.value,
          prenom: state.prenom.value,
          email: state.email.value,
          phone: state.phone.value,
          password: state.password.value,
          genre: state.genre.value,
          photo: "photo",
          creatAt: DateTime.now());
      AuthenticationResponse authenticationResponse =
          await _auth.registerUser(user);
      if (authenticationResponse.status == AuthenticationStatus.authenticated) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  void _nomChanged(RegisterNomChanged event, Emitter<RegisterState> emit) {
    final nom = Nom.dirty(event.nom);
    emit(
      state.copyWith(
        nom: nom,
        isValid: Formz.validate([
          state.password,
          nom,
          state.prenom,
          state.email,
          state.phone,
          state.genre
        ]),
      ),
    );
  }

  void _prenomChanged(
      RegisterPrenomChanged event, Emitter<RegisterState> emit) {
    final prenom = Prenom.dirty(event.prenom);
    emit(
      state.copyWith(
        prenom: prenom,
        isValid: Formz.validate([
          state.password,
          state.nom,
          prenom,
          state.email,
          state.phone,
          state.genre
        ]),
      ),
    );
  }

  void _emailChanged(RegisterEmailChanged event, Emitter<RegisterState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.password,
          state.nom,
          state.prenom,
          email,
          state.phone,
          state.genre
        ]),
      ),
    );
  }

  void _phoneChanged(RegisterPhoneChanged event, Emitter<RegisterState> emit) {
    final phone = Phone.dirty(event.phone);
    emit(
      state.copyWith(
        phone: phone,
        isValid: Formz.validate([
          state.password,
          state.nom,
          state.prenom,
          state.email,
          phone,
          state.genre
        ]),
      ),
    );
  }

  void _passwordChanged(
      RegisterPasswordChanged event, Emitter<RegisterState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([
          state.nom,
          state.prenom,
          state.email,
          state.phone,
          password,
          state.genre
        ]),
      ),
    );
  }

  void _genreChanged(RegisterGenreChanged event, Emitter<RegisterState> emit) {
    final genre = Genre.dirty(event.genre);
    emit(
      state.copyWith(
        genre: genre,
        isValid: Formz.validate([
          state.password,
          state.nom,
          state.prenom,
          state.email,
          state.phone,
          genre
        ]),
      ),
    );
  }
}
