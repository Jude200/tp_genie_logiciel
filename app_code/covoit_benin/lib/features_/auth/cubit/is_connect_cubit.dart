import 'package:bloc/bloc.dart';
import 'package:covoit_benin/core_/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsConnectCubit extends Cubit<bool> {
  IsConnectCubit() : super(false);

  void isConnect() async {
    final pref = await SharedPreferences.getInstance();
    String? isConnected = pref.getString(SharedPreferencesAuthKeys.authToken);
    emit(isConnected == null);
  }
}
