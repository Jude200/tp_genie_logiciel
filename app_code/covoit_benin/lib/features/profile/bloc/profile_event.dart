part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {}

class ProfileRoleChangeEvent extends ProfileEvent {
  const ProfileRoleChangeEvent({required this.value});
  final bool value;
}
