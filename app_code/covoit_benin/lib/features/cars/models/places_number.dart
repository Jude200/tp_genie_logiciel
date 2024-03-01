import 'package:formz/formz.dart';

enum PlacesNumberValidationError { invalid }

final class PlacesNumber
    extends FormzInput<String, PlacesNumberValidationError> {
  const PlacesNumber.pure([super.value = '']) : super.pure();
  const PlacesNumber.dirty([super.value = '']) : super.dirty();

  @override
  PlacesNumberValidationError? validator(String? value) {
    return value != null && value != ''
        ? null
        : PlacesNumberValidationError.invalid;
  }
}
