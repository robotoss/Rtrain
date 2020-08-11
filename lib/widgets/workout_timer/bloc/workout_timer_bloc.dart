import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'workout_timer_event.dart';
part 'workout_timer_state.dart';

class WorkoutTimerBloc extends Bloc<WorkoutTimerEvent, WorkoutTimerState> {
  final int timeSeconds;
  final Function func;
  WorkoutTimerBloc({@required this.timeSeconds, @required this.func})
      : super(WorkoutTimerInitialState(percent: 0.0, duration: timeSeconds));

  double percent = 0.0;

  // int startTime = 60;
  int duration;

  Timer timer;

  @override
  Stream<WorkoutTimerState> mapEventToState(
    WorkoutTimerEvent event,
  ) async* {
    if (event is StartTimerSecEvent) {
      yield* _buildStartTimerEvent();
    }
    if (event is UpdateTimerEvent) {
      yield* _buildUpdateTimerEvent();
    }
    if (event is StopTimerEvent) {
      yield* _buildStopTimerEvent(event.context);
    }
  }

  Stream<WorkoutTimerState> _buildStartTimerEvent() async* {
    duration = timeSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      double onePercent = 100 / timeSeconds;
      if (duration == 0) {
        timer.cancel();
        percent = 100;
        add(UpdateTimerEvent());
        func();
      } else {
        duration = duration - 1;
        percent = (timeSeconds - duration) * onePercent;
        add(UpdateTimerEvent());
      }
    });
  }

  Stream<WorkoutTimerState> _buildUpdateTimerEvent() async* {
    yield WorkoutTimerInitialState(percent: percent, duration: duration);
  }

  Stream<WorkoutTimerState> _buildStopTimerEvent(BuildContext context) async* {}
}
