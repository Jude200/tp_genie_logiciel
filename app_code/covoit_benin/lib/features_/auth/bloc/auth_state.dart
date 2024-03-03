// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final bool isValid;
  final bool isCreatedAccountClicked;
  final AuthenticationResponse? authenticationResponse;
  const AuthState(
      {this.status = FormzSubmissionStatus.initial,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.isValid = false,
      this.isCreatedAccountClicked = false,
      this.authenticationResponse});

  AuthState copyWith(
      {FormzSubmissionStatus? status,
      Email? email,
      Password? password,
      bool? isValid,
      bool? isCreatedAccountClicked,
      AuthenticationResponse? authenticationResponse}) {
    return AuthState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        isValid: isValid ?? this.isValid,
        isCreatedAccountClicked:
            isCreatedAccountClicked ?? this.isCreatedAccountClicked,
        authenticationResponse:
            authenticationResponse ?? this.authenticationResponse);
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isCreatedAccountClicked,
        authenticationResponse
      ];
}
