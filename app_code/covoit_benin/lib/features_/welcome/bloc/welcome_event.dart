part of 'welcome_bloc.dart';

sealed class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class WelcomeInitialEvent extends WelcomeEvent {}

class WelcomeSignOutEvent extends WelcomeEvent {}
