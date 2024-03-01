import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(_init);
    on<ProfileRoleChangeEvent>(_ruleChanged);
  }

  void _init(ProfileInitialEvent event, Emitter<ProfileState> emit) {}

  void _ruleChanged(ProfileRoleChangeEvent event, Emitter<ProfileState> emit) {}
}
