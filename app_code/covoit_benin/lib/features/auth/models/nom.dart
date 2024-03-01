import 'package:formz/formz.dart';

enum NomValidationError { invalid }

final class Nom extends FormzInput<String, NomValidationError> {
  const Nom.pure([super.value = '']) : super.pure();
  const Nom.dirty([super.value = '']) : super.dirty();

  @override
  NomValidationError? validator(String? value) {
    return value != null && value != '' ? null : NomValidationError.invalid;
  }
}
