// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'vehicle_bloc.dart';

class VehicleState extends Equatable {
  const VehicleState({
    this.mark = const Mark.pure(),
    this.plateNumber = const PlateNumber.pure(),
    this.enginNumber = const EnginNumber.pure(),
    this.placesNumber = const PlacesNumber.pure(),
    this.photos = const Photos.pure(),
    this.isValid = false,
    this.status = FormzSubmissionStatus.initial,
  });
  final Mark mark;
  final PlateNumber plateNumber;
  final EnginNumber enginNumber;
  final PlacesNumber placesNumber;
  final Photos photos;
  final bool isValid;
  final FormzSubmissionStatus status;

  @override
  List<Object> get props =>
      [mark, placesNumber, plateNumber, enginNumber, photos];

  VehicleState copyWith({
    Mark? mark,
    PlateNumber? plateNumber,
    EnginNumber? enginNumber,
    PlacesNumber? placesNumber,
    Photos? photos,
    bool? isValid,
    FormzSubmissionStatus? status,
  }) {
    return VehicleState(
      mark: mark ?? this.mark,
      plateNumber: plateNumber ?? this.plateNumber,
      enginNumber: enginNumber ?? this.enginNumber,
      placesNumber: placesNumber ?? this.placesNumber,
      photos: photos ?? this.photos,
      isValid: isValid ?? this.isValid,
      status: status ?? this.status,
    );
  }
}
