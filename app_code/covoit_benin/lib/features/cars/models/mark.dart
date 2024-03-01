import 'package:formz/formz.dart';

enum MarkValidationError { invalid }

final class Mark extends FormzInput<String, MarkValidationError> {
  const Mark.pure([super.value = '']) : super.pure();
  const Mark.dirty([super.value = '']) : super.dirty();

  @override
  MarkValidationError? validator(String? value) {
    return value != null && value != '' ? null : MarkValidationError.invalid;
  }
}
