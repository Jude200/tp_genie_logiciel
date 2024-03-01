import 'package:covoit_benin/cores/models/car.dart';
import 'package:covoit_benin/cores/models/path/path.dart';

class DriverPath extends CoPath {
  final bool isActive;
  final Vehicle vehicle;
  final int places;
  final DateTime timeStart;
  final DateTime createdAt;
  final String userId;

  DriverPath(
      {required super.id,
      required super.origin,
      required super.destination,
      required this.timeStart,
      required this.places,
      this.isActive = false,
      required this.vehicle,
      required this.userId,
      required this.createdAt});
}
