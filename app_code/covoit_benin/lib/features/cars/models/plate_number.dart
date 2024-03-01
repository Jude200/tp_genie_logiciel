import 'package:formz/formz.dart';

enum PlateNumberValidationError { invalid }

final class PlateNumber extends FormzInput<String, PlateNumberValidationError> {
  const PlateNumber.pure([super.value = '']) : super.pure();
  const PlateNumber.dirty([super.value = '']) : super.dirty();

  @override
  PlateNumberValidationError? validator(String? value) {
    return value != null && value != ''
        ? null
        : PlateNumberValidationError.invalid;
  }
}
