// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState(
      {this.status = FormzSubmissionStatus.initial,
      this.vehicle,
      this.startingDepartmentCode = 'ali',
      this.startingTownCode = 'ban',
      this.startDistrictCode = 'bak',
      this.startingNeighborhoodCode = 'ag34',
      this.destinationDepartmentCode = 'ali',
      this.destinationTownCode = 'ban',
      this.destinationDistrictCode = 'bak',
      this.destinationNeighborhoodCode = 'ag34',
      this.comment});
  final FormzSubmissionStatus status;
  final Vehicle? vehicle;
  final String startingDepartmentCode;
  final String startingTownCode;
  final String startingNeighborhoodCode;
  final String startDistrictCode;
  final String destinationDepartmentCode;
  final String destinationTownCode;
  final String destinationNeighborhoodCode;
  final String destinationDistrictCode;
  final String? comment;

  @override
  List<Object?> get props => [
        vehicle,
        status,
        startingDepartmentCode,
        startingTownCode,
        startingNeighborhoodCode,
        destinationDepartmentCode,
        destinationTownCode,
        destinationNeighborhoodCode,
        comment
      ];

  SearchState copyWith({
    FormzSubmissionStatus? status,
    Vehicle? vehicle,
    String? startingDepartmentCode,
    String? startingTownCode,
    String? startDistrictCode,
    String? startingNeighborhoodCode,
    String? destinationDepartmentCode,
    String? destinationTownCode,
    String? destinationDistrictCode,
    String? destinationNeighborhoodCode,
    String? comment,
  }) {
    return SearchState(
      status: status ?? this.status,
      vehicle: vehicle ?? this.vehicle,
      startingDepartmentCode:
          startingDepartmentCode ?? this.startingDepartmentCode,
      startingTownCode: startingTownCode ?? this.startingTownCode,
      startDistrictCode: startDistrictCode ?? this.startDistrictCode,
      startingNeighborhoodCode:
          startingNeighborhoodCode ?? this.startingNeighborhoodCode,
      destinationDepartmentCode:
          destinationDepartmentCode ?? this.destinationDepartmentCode,
      destinationTownCode: destinationTownCode ?? this.destinationTownCode,
      destinationDistrictCode:
          destinationDistrictCode ?? this.destinationDistrictCode,
      destinationNeighborhoodCode:
          destinationNeighborhoodCode ?? this.destinationNeighborhoodCode,
      comment: comment ?? this.comment,
    );
  }
}
