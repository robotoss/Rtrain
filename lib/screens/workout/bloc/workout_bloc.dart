import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  @override
  WorkoutState get initialState => WorkoutInitial();

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
