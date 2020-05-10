part of 'workout_timer_bloc.dart';

abstract class WorkoutTimerEvent extends Equatable {
  const WorkoutTimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimerEvent extends WorkoutTimerEvent {}

class UpdateTimerEvent extends WorkoutTimerEvent {}