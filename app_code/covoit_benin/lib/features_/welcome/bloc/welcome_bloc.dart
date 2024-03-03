import 'package:bloc/bloc.dart';
import 'package:covoit_benin/core_/entities/diary.dart';
import 'package:covoit_benin/core_/repositories/auth_repo.dart';
import 'package:covoit_benin/core_/repositories/diary.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(const WelcomeState()) {
    on<WelcomeInitialEvent>(_init);
    on<WelcomeSignOutEvent>(_signOut);
  }

  final _repo = DiaryRepo();

  Future<void> _init(
      WelcomeInitialEvent event, Emitter<WelcomeState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString(SharedPreferencesAuthKeys.authToken)!);

    List<Diary>? diaries = await _repo.getAll(
        sharedPreferences.getString(SharedPreferencesAuthKeys.authToken)!);
    emit(state.copyWith(diary: diaries, status: FormzSubmissionStatus.initial));
  }

  final _auth = AuthRepo();

  void _signOut(WelcomeSignOutEvent event, Emitter<WelcomeState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    await _auth.signOut();
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(SharedPreferencesAuthKeys.authToken);
    emit(state.copyWith(status: FormzSubmissionStatus.canceled));
  }
}
