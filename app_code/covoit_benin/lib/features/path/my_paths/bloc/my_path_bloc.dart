import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_path_event.dart';
part 'my_path_state.dart';

class MyPathBloc extends Bloc<MyPathEvent, MyPathState> {
  MyPathBloc() : super(MyPathInitial()) {
    on<MyPathEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
