part of 'workout_timer_bloc.dart';

abstract class WorkoutTimerState extends Equatable {
  const WorkoutTimerState();

  @override
  List<Object> get props => [];
}

class WorkoutTimerInitialState extends WorkoutTimerState {
  final double percent;
  final int duration;

  const WorkoutTimerInitialState({@required this.percent, @required this.duration});

  @override
  List<Object> get props => [percent, duration];

  @override
  String toString() => 'WorkoutTimerInitialState { percent: $percent, duration: $duration }';
}

class WorkoutTimerLoadingState extends WorkoutTimerState {}

class WorkoutTimerFailureState extends WorkoutTimerState {
  final String error;

  const WorkoutTimerFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WorkoutTimerFailureState { error: $error }';
}
