part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged({
    required this.phone,
  });
  final String phone;

  @override
  List<Object> get props => [phone];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged({
    required this.password,
  });
  final String password;

  @override
  List<Object> get props => [password];
}

final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
