import 'package:bloc/bloc.dart';
import 'package:covoit_benin/cores/models/car.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:location_data_bj/location_data_bj.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchInitialEvent>(_init);
    on<DropdownInputChangeEvent>(_dropDownInputChange);
    on<VehicleAddEvent>(_addVehicle);
    on<CommentChangeEvent>(_commentChange);
    on<SubmitedEvent>(_submit);
  }
  void _init(SearchInitialEvent event, Emitter<SearchState> emit) {}

  void _dropDownInputChange(
      DropdownInputChangeEvent event, Emitter<SearchState> emit) {
    switch (event.input.key) {
      case '__startingDepartment':
        String stDep = event.input.value;
        String stTown =
            LocationData.townsOfDepartment(event.input.value).first.code;
        String stDist = LocationData.districtsOfTown(stTown).first.code;
        String stNeigh =
            LocationData.neighborhoodsOfDistrict(stDist).first.code;

        // print(
        //     {"depar": stDep, "vlle": stTown, 'arrr': stDist, 'quat': stNeigh});

        SearchState state_ = state.copyWith(
            startingDepartmentCode: stDep,
            startingTownCode: stTown,
            startDistrictCode: stDist,
            startingNeighborhoodCode: stNeigh);
        emit(state_);
        break;
      case '__startingTown':
        String stTown = event.input.value;
        String stDist = LocationData.districtsOfTown(stTown).first.code;
        String stNeigh =
            LocationData.neighborhoodsOfDistrict(stDist).first.code;

        SearchState state_ = state.copyWith(
            startingTownCode: stTown,
            startDistrictCode: stDist,
            startingNeighborhoodCode: stNeigh);
        emit(state_);

        break;
      case '__startingDistrict':
        String stDist = event.input.value;
        String stNeigh =
            LocationData.neighborhoodsOfDistrict(stDist).first.code;

        // print(
        //     {"depar": stDep, "vlle": stTown, 'arrr': stDist, 'quat': stNeigh});

        SearchState state_ = state.copyWith(
            startDistrictCode: stDist, startingNeighborhoodCode: stNeigh);
        emit(state_);
        break;
      case '__startingHeignborHood':
        String stNeigh = event.input.value;

        // print(
        //     {"depar": stDep, "vlle": stTown, 'arrr': stDist, 'quat': stNeigh});

        SearchState state_ = state.copyWith(startingNeighborhoodCode: stNeigh);
        emit(state_);
        break;
      default:
        throw "This input key doesn't exist";
    }
  }

  void _addVehicle(VehicleAddEvent event, Emitter<SearchState> emit) {}
  void _commentChange(CommentChangeEvent event, Emitter<SearchState> emit) {}
  void _submit(SubmitedEvent event, Emitter<SearchState> emit) {}
}
