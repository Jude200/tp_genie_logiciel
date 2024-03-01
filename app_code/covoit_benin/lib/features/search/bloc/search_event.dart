// ignore_for_file: camel_case_types

part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialEvent extends SearchEvent {}

class DropdownInputChangeEvent extends SearchEvent {
  const DropdownInputChangeEvent({required this.input});
  final MapEntry input;
}

class VehicleAddEvent extends SearchEvent {}

class CommentChangeEvent extends SearchEvent {
  const CommentChangeEvent({required this.value});
  final String value;
}

class SubmitedEvent extends SearchEvent {
  const SubmitedEvent({required this.value});
  final String value;
}
