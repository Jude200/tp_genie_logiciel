import 'package:formz/formz.dart';

enum EnginNumberValidationError { invalid }

final class EnginNumber extends FormzInput<String, EnginNumberValidationError> {
  const EnginNumber.pure([super.value = '']) : super.pure();
  const EnginNumber.dirty([super.value = '']) : super.dirty();

  @override
  EnginNumberValidationError? validator(String? value) {
    return value != null && value != ''
        ? null
        : EnginNumberValidationError.invalid;
  }
}
