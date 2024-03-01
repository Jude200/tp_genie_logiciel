import 'package:formz/formz.dart';

enum PrenomValidationError { invalid }

final class Prenom extends FormzInput<String, PrenomValidationError> {
  const Prenom.pure([super.value = '']) : super.pure();
  const Prenom.dirty([super.value = '']) : super.dirty();

  @override
  PrenomValidationError? validator(String? value) {
    return value != null && value != '' ? null : PrenomValidationError.invalid;
  }
}
