import 'package:flutter_application_block_28march/bloc/Counter%20Bloc/counter_event.dart';
import 'package:flutter_application_block_28march/bloc/Counter%20Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;
  CounterBloc() : super(InitialState()) {
    on<NumberIncrease>(onNumberIncrease); //~ onClick do this like JS
    on<NumberDecrease>(onNumberDecrease);
  }

  void onNumberIncrease(
      NumberIncrease event, Emitter<CounterStates> emit) async {
    counter += 1;
    emit(UpdateState(counter));
  }

  void onNumberDecrease(
      NumberDecrease event, Emitter<CounterStates> emit) async {
    counter -= 1;
    emit(UpdateState(counter));
  }
}
