import 'package:formz/formz.dart';

enum PhoneValidationError { invalid }

final class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure([super.value = '']) : super.pure();
  const Phone.dirty([super.value = '']) : super.dirty();

  @override
  PhoneValidationError? validator(String? value) {
    return value != null && value != '' && value.length == 8
        ? null
        : PhoneValidationError.invalid;
  }
}
