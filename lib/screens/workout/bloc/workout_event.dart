part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();

  @override
  List<Object> get props => [];
}

class WorkoutLoadMainDataEvent extends WorkoutEvent {}

class StartButtonPressedEvent extends WorkoutEvent {}
