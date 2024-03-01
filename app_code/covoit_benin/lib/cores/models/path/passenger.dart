import 'package:covoit_benin/cores/models/path/path.dart';

class PassengerPath extends CoPath {
  final String userId;
  final bool enable;
  PassengerPath(
      {required super.id,
      required super.origin,
      required super.destination,
      required this.userId,
      this.enable = false});
}
