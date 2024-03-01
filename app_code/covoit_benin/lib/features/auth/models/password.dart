import 'package:formz/formz.dart';

enum PasswordValidationError { invalid }

final class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure([super.value = '']) : super.pure();
  const Password.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String? value) {
    return value!.isNotEmpty && value.length > 8
        ? null
        : PasswordValidationError.invalid;
  }
}
