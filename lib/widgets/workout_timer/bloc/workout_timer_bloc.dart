import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'workout_timer_event.dart';
part 'workout_timer_state.dart';

class WorkoutTimerBloc extends Bloc<WorkoutTimerEvent, WorkoutTimerState> {
  @override
  WorkoutTimerState get initialState =>
      WorkoutTimerInitialState(percent: percent, duration: startTime);

  double percent = 0.0;

  int startTime = 60;
  int duration;

  Timer timer;

  @override
  Stream<WorkoutTimerState> mapEventToState(
    WorkoutTimerEvent event,
  ) async* {
    if (event is StartTimerEvent) {
      yield* _buildStartTimerEvent();
    }
    if (event is UpdateTimerEvent) {
      yield* _buildUpdateTimerEvent();
    }
  }

  Stream<WorkoutTimerState> _buildStartTimerEvent() async* {
    duration = startTime;
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      double onePercent = 100 /startTime;
      if (duration == 0) {
        timer.cancel();
        percent = 100;
         add(UpdateTimerEvent());
      } else {
        duration = duration - 1;
        percent = (startTime - duration) * onePercent;
        add(UpdateTimerEvent());
        
      }
    });
  }

  Stream<WorkoutTimerState> _buildUpdateTimerEvent() async* {
    yield WorkoutTimerInitialState(percent: percent, duration: duration);
  }
}
