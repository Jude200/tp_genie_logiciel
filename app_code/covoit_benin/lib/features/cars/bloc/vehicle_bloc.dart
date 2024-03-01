import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:covoit_benin/features/cars/models/engin_number.dart';
import 'package:covoit_benin/features/cars/models/mark.dart';
import 'package:covoit_benin/features/cars/models/photos.dart';
import 'package:covoit_benin/features/cars/models/places_number.dart';
import 'package:covoit_benin/features/cars/models/plate_number.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final String? vehicleId;
  VehicleBloc(this.vehicleId) : super(VehicleState()) {
    on<VehicleInitialEvent>(_init);
    on<VehicleMarkChanged>(_markChanged);
    on<VehiclePlateNumberChanged>(_plateNumberChanged);
    on<VehicleEnginNumberChanged>(_enginNumberChanged);
    on<VehiclePlacesNumberChanged>(_placeNumberChanged);
    on<VehiclePhotosChanged>(_photoChanged);
    on<VehicleSubmitted>(_submit);
  }

  void _init(VehicleInitialEvent event, Emitter<VehicleState> emit) {}
  void _submit(VehicleSubmitted event, Emitter<VehicleState> emit) {}
  void _markChanged(VehicleMarkChanged event, Emitter<VehicleState> emit) {
    final mark = Mark.dirty(event.mark);
    emit(state.copyWith(
        mark: mark,
        isValid: Formz.validate([
          mark,
          state.plateNumber,
          state.enginNumber,
          state.placesNumber,
          state.photos
        ])));
  }

  void _plateNumberChanged(
      VehiclePlateNumberChanged event, Emitter<VehicleState> emit) {
    final plateNumber = PlateNumber.dirty(event.plateNumber);
    emit(state.copyWith(
        plateNumber: plateNumber,
        isValid: Formz.validate([
          state.mark,
          plateNumber,
          state.enginNumber,
          state.placesNumber,
          state.photos
        ])));
  }

  void _enginNumberChanged(
      VehicleEnginNumberChanged event, Emitter<VehicleState> emit) {
    final enginNumber = EnginNumber.dirty(event.enginNumber);
    emit(state.copyWith(
        enginNumber: enginNumber,
        isValid: Formz.validate([
          state.mark,
          state.plateNumber,
          enginNumber,
          state.placesNumber,
          state.photos
        ])));
  }

  void _placeNumberChanged(
      VehiclePlacesNumberChanged event, Emitter<VehicleState> emit) {
    final placesNumber = PlacesNumber.dirty(event.placesNumber);
    emit(state.copyWith(
        placesNumber: placesNumber,
        isValid: Formz.validate([
          state.mark,
          state.plateNumber,
          state.enginNumber,
          placesNumber,
          state.photos
        ])));
  }

  void _photoChanged(
      VehiclePhotosChanged event, Emitter<VehicleState> emit) async {
    await getLostData();
    final photos = Photos.dirty(event.photos);
    emit(state.copyWith(
        photos: photos,
        isValid: Formz.validate([
          state.mark,
          state.plateNumber,
          state.enginNumber,
          state.placesNumber,
          photos
        ])));
  }

  Future<void> getLostData() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // final List<XFile>? files = response.files;
    if (image != null) {
      log(image.path);
    } else {
      log("Exception");
    }
  }
}
