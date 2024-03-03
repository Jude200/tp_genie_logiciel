// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'welcome_bloc.dart';

class WelcomeState extends Equatable {
  final FormzSubmissionStatus status;
  final List<Diary> diary;
  const WelcomeState({
    this.status = FormzSubmissionStatus.initial,
    this.diary = const [],
  });

  @override
  List<Object> get props => [status, diary];

  WelcomeState copyWith({
    FormzSubmissionStatus? status,
    List<Diary>? diary,
  }) {
    return WelcomeState(
      status: status ?? this.status,
      diary: diary ?? this.diary,
    );
  }
}
