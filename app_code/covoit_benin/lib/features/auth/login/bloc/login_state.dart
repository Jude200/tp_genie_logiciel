// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final Phone phone;
  final Password password;
  final bool isValid;
  final FormzSubmissionStatus status;
  const LoginState({
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });

  @override
  List<Object> get props => [phone, password, isValid, status];

  LoginState copyWith({
    Phone? phone,
    Password? password,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return LoginState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }
}
