// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_diary_bloc.dart';

class AddDiaryState extends Equatable {
  const AddDiaryState(
      {this.title = const DTitle.pure(),
      this.content = const DContent.pure(),
      this.imageUrl,
      this.status = FormzSubmissionStatus.initial,
      this.isValid = false});
  final DTitle title;
  final DContent content;
  final String? imageUrl;
  final FormzSubmissionStatus status;
  final bool isValid;

  @override
  List<Object?> get props => [title, content, isValid, status, imageUrl];

  AddDiaryState copyWith({
    DTitle? title,
    DContent? content,
    String? imageUrl,
    FormzSubmissionStatus? status,
    bool? isValid,
  }) {
    return AddDiaryState(
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
    );
  }
}
