import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void incrementValue() {
    emit(state + 1);
  }

  void decrementValue() {
    emit(state - 1);
  }
}