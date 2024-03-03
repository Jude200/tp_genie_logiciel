import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:covoit_benin/core_/entities/diary.dart';
import 'package:covoit_benin/core_/repositories/auth_repo.dart';
import 'package:covoit_benin/core_/repositories/diary.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';

part 'add_diary_event.dart';
part 'add_diary_state.dart';

class AddDiaryBloc extends Bloc<AddDiaryEvent, AddDiaryState> {
  AddDiaryBloc() : super(AddDiaryState()) {
    on<AddDiaryTitleChanged>(_onTitleChanged);
    on<AddDiaryContentChanged>(_onContentChanged);
    on<AddDiaryImageChanged>(_onImageChanged);
    on<AddDiarySubmitted>(_onSubmitted);
  }

  final _repo = DiaryRepo();

  void _onTitleChanged(
    AddDiaryTitleChanged event,
    Emitter<AddDiaryState> emit,
  ) {
    final title = DTitle.dirty(event.title);
    emit(
      state.copyWith(
        title: title,
        isValid: Formz.validate([state.content, title]),
      ),
    );
  }

  void _onContentChanged(
    AddDiaryContentChanged event,
    Emitter<AddDiaryState> emit,
  ) {
    final content = DContent.dirty(event.content);
    emit(
      state.copyWith(
        content: content,
        isValid: Formz.validate([content, state.title]),
      ),
    );
  }

  void _onImageChanged(
      AddDiaryImageChanged event, Emitter<AddDiaryState> emit) {
    emit(state.copyWith(imageUrl: event.value));
  }

  void _onSubmitted(
      AddDiarySubmitted event, Emitter<AddDiaryState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token =
        sharedPreferences.getString(SharedPreferencesAuthKeys.authToken);

    log("Submited ...");
    if (token != null) {
      Diary diary = Diary(
          id: DateTime.now().toString(),
          title: state.title.value,
          content: state.content.value,
          photoUrls: state.imageUrl,
          userId: token,
          createdAt: DateTime.now());
      log("Send ...");
      DairyRequestResponse? response = await _repo.save(diary);
      if (response != null) {
        if (response.status == DairyRequestStatus.success) {
          log("Save Success ...");
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        } else {
          log("Failure ... ");
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
    emit(state.copyWith(status: FormzSubmissionStatus.initial));
  }
}
