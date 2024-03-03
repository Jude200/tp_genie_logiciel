import 'package:formz/formz.dart';

enum DContentValidationError { empty }

class DContent extends FormzInput<String, DContentValidationError> {
  const DContent.pure() : super.pure('');
  const DContent.dirty([super.value = '']) : super.dirty();

  @override
  DContentValidationError? validator(String value) {
    if (value.isEmpty) return DContentValidationError.empty;
    return null;
  }
}
