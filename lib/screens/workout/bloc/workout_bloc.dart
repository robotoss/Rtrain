import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  @override
  WorkoutState get initialState => WorkoutLoadingState();

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
    yield WorkoutInitialState();
  }

  Stream<WorkoutState> _buildStartButtonPressedEvent() async* {
    yield WorkoutActiveState();
  }
}
