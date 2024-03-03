part of 'add_diary_bloc.dart';

sealed class AddDiaryEvent extends Equatable {
  const AddDiaryEvent();

  @override
  List<Object> get props => [];
}

final class AddDiaryTitleChanged extends AddDiaryEvent {
  const AddDiaryTitleChanged(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

final class AddDiaryContentChanged extends AddDiaryEvent {
  const AddDiaryContentChanged(this.content);

  final String content;

  @override
  List<Object> get props => [content];
}

final class AddDiaryImageChanged extends AddDiaryEvent {
  const AddDiaryImageChanged(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}

final class AddDiarySubmitted extends AddDiaryEvent {
  const AddDiarySubmitted();
}
