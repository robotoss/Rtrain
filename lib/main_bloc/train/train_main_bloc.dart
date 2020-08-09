import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pedometer/pedometer.dart';

part 'train_main_event.dart';
part 'train_main_state.dart';

class TrainMainBloc extends Bloc<TrainMainEvent, TrainMainState> {
  TrainMainBloc() : super(TrainMainInitial());

  // Pedometer _pedometer;
  // StreamSubscription<int> _subscription;

  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;

  int steps;

  @override
  Stream<TrainMainState> mapEventToState(
    TrainMainEvent event,
  ) async* {
    if (event is StartWorkoutEvent) {
      yield* _buildStartWorkoutEvent();
    }
  }

  Stream<TrainMainState> _buildStartWorkoutEvent() async* {
    // _pedometer = new Pedometer();
    // _subscription = _pedometer.pedometerStream.listen((int stepCountValue) {
    //   print(stepCountValue);
    // }, onError: (error) {
    //   print("Flutter Pedometer Error: $error");
    // }, onDone: () {
    //   print("Finished pedometer tracking");
    // }, cancelOnError: true);

    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen((event) {
      steps = event.steps;
      DateTime timeStamp = event.timeStamp;
    }).onError((error) {});

    _pedestrianStatusStream.listen((event) {
      String status = event.status;
      DateTime timeStamp = event.timeStamp;
    }).onError((error) {});
  }
}
