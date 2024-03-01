// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  void changeState(int index) {
    emit(index);
  }
}
