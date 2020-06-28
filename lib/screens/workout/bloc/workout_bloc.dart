import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  @override
  WorkoutState get initialState => WorkoutLoadingState();

  Pedometer _pedometer;
  StreamSubscription<int> _subscription;

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is WorkoutLaodMainDataEvent) {
      yield* _buildWorkoutLaodMainDataEvent();
    }
    if (event is StartButtonPressedEvent) {
      yield* _buildStartButtonPressedEvent();
    }
  }

  Stream<WorkoutState> _buildWorkoutLaodMainDataEvent() async* {
    _pedometer = new Pedometer();
    _subscription = _pedometer.pedometerStream.listen((int stepCountValue) {
      print(stepCountValue);
    }, onError: (error) {
      print("Flutter Pedometer Error: $error");
    }, onDone: () {
      print("Finished pedometer tracking");
    }, cancelOnError: true);

    yield WorkoutInitialState();
  }

  Stream<WorkoutState> _buildStartButtonPressedEvent() async* {
    yield WorkoutActiveState();
  }
}
