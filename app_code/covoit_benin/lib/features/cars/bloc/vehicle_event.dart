part of 'vehicle_bloc.dart';

sealed class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

class VehicleInitialEvent extends VehicleEvent {}

class VehicleSubmitted extends VehicleEvent {}

class VehicleMarkChanged extends VehicleEvent {
  const VehicleMarkChanged({required this.mark});
  final String mark;
}

class VehiclePlateNumberChanged extends VehicleEvent {
  const VehiclePlateNumberChanged({required this.plateNumber});
  final String plateNumber;
}

class VehicleEnginNumberChanged extends VehicleEvent {
  const VehicleEnginNumberChanged({required this.enginNumber});
  final String enginNumber;
}

class VehiclePlacesNumberChanged extends VehicleEvent {
  const VehiclePlacesNumberChanged({required this.placesNumber});
  final String placesNumber;
}

class VehiclePhotosChanged extends VehicleEvent {
  const VehiclePhotosChanged({required this.photos});
  final String photos;
}
