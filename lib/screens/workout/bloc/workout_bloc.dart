import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(WorkoutLoadingState());

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is WorkoutLoadMainDataEvent) {
      yield* _buildWorkoutLoadMainDataEvent();
    }
    if (event is StartButtonPressedEvent) {
      yield* _buildStartButtonPressedEvent();
    }
  }

  Stream<WorkoutState> _buildWorkoutLoadMainDataEvent() async* {
    yield WorkoutInitialState();
  }

  Stream<WorkoutState> _buildStartButtonPressedEvent() async* {
    yield WorkoutActiveState();
  }
}
