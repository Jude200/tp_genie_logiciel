// ignore_for_file: public_member_api_docs, sort_constructors_first
class Vehicle {
  final String? id;
  final String mark;
  final String plateNumber;
  final String enginNumber;
  final int placeNumber;
  final List<String> photos;
  Vehicle({
    this.id,
    required this.mark,
    required this.plateNumber,
    required this.enginNumber,
    required this.placeNumber,
    required this.photos,
  });
}
