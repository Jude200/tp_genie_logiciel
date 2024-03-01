import 'package:image_picker/image_picker.dart';

Future<List<XFile>?> pickManyImages() async {
  final ImagePicker picker = ImagePicker();

  final List<XFile> images = await picker.pickMultiImage();

  // final List<XFile>? files = response.files;
  return images;
}

Future<XFile?> pickOneImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  // final List<XFile>? files = response.files;
  return image;
}
