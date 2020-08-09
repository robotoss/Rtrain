import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedometer/pedometer.dart';

part 'train_main_event.dart';
part 'train_main_state.dart';

class TrainMainBloc extends Bloc<TrainMainEvent, TrainMainState> {
  TrainMainBloc() : super(TrainMainInitial());

  Pedometer _pedometer;
  StreamSubscription<int> _subscription;

  @override
  Stream<TrainMainState> mapEventToState(
    TrainMainEvent event,
  ) async* {
    if (event is StartWorkoutEvent) {
      yield* _buildStartWorkoutEvent();
    }
  }

  Stream<TrainMainState> _buildStartWorkoutEvent() async* {
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen((int stepCountValue) {
      print(stepCountValue);
    }, onError: (error) {
      print("Flutter Pedometer Error: $error");
    }, onDone: () {
      print("Finished pedometer tracking");
    }, cancelOnError: true);
  }
}
