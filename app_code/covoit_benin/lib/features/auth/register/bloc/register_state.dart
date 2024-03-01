// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

enum RegisterStatus { initial, loading, success, failure }

// ignore: must_be_immutable
class RegisterState extends Equatable {
  final bool isValid;
  final Nom nom;
  final Prenom prenom;
  final Email email;
  final Phone phone;
  final Password password;
  final Genre genre;
  final FormzSubmissionStatus status;
  final String? errorMessage;

  const RegisterState({
    this.isValid = false,
    this.nom = const Nom.pure(),
    this.prenom = const Prenom.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.genre = const Genre.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        nom,
        prenom,
        email,
        phone,
        password,
        genre,
        errorMessage,
        isValid,
        status
      ];

  RegisterState copyWith(
      {bool? isValid,
      Nom? nom,
      Prenom? prenom,
      Email? email,
      Phone? phone,
      Password? password,
      Genre? genre,
      FormzSubmissionStatus? status,
      String? errorMessage}) {
    return RegisterState(
      isValid: isValid ?? this.isValid,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      genre: genre ?? this.genre,
      status: status ?? this.status,
    );
  }
}
