// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEventInitial extends RegisterEvent {}

class RegisterNomChanged extends RegisterEvent {
  const RegisterNomChanged({
    required this.nom,
  });
  final String nom;

  @override
  List<Object> get props => [nom];
}

class RegisterPrenomChanged extends RegisterEvent {
  const RegisterPrenomChanged({
    required this.prenom,
  });
  final String prenom;

  @override
  List<Object> get props => [prenom];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged({
    required this.email,
  });
  final String email;

  @override
  List<Object> get props => [email];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged({
    required this.phone,
  });
  final String phone;

  @override
  List<Object> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged({
    required this.password,
  });
  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterGenreChanged extends RegisterEvent {
  const RegisterGenreChanged({
    required this.genre,
  });
  final String genre;

  @override
  List<Object> get props => [genre];
}

final class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();
}


// class RegisterNomChanged extends RegisterEvent {
//   const RegisterNomChanged({
//     required this.nom,
//   });
//   final String nom;

//   @override
//   List<Object> get props => [nom];
// }
