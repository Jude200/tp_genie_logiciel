part of 'my_path_bloc.dart';

sealed class MyPathState extends Equatable {
  const MyPathState();
  
  @override
  List<Object> get props => [];
}

final class MyPathInitial extends MyPathState {}
