import 'package:formz/formz.dart';

enum GenreValidationError { invalid }

final class Genre extends FormzInput<String, GenreValidationError> {
  const Genre.pure([super.value = 'Homme']) : super.pure();
  const Genre.dirty([super.value = '']) : super.dirty();

  @override
  GenreValidationError? validator(String? value) {
    return value != null && value != '' ? null : GenreValidationError.invalid;
  }
}
