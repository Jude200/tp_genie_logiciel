import 'package:formz/formz.dart';

enum PhotosValidationError { invalid }

final class Photos extends FormzInput<String, PhotosValidationError> {
  const Photos.pure([super.value = '']) : super.pure();
  const Photos.dirty([super.value = '']) : super.dirty();

  @override
  PhotosValidationError? validator(String? value) {
    return value != null && value != '' ? null : PhotosValidationError.invalid;
  }
}
