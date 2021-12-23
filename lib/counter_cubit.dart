import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void increment(CounterState state) {
    emit(CounterState(state.counter + 1));
  }

  void decrement(CounterState state) {
    emit(CounterState(state.counter - 1));
  }
}
