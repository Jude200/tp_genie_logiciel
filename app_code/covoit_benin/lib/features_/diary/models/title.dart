import 'package:formz/formz.dart';

enum DTitleValidationError { empty }

class DTitle extends FormzInput<String, DTitleValidationError> {
  const DTitle.pure() : super.pure('');
  const DTitle.dirty([super.value = '']) : super.dirty();

  @override
  DTitleValidationError? validator(String value) {
    if (value.isEmpty) return DTitleValidationError.empty;
    return null;
  }
}
