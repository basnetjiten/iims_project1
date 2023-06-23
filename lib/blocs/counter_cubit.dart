import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int _counter = 0;

  void increment() {
    _counter = state + 2;
    emit(_counter);
  }
}
