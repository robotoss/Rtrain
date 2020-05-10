part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitialState extends WorkoutState {}

class WorkoutActiveState extends WorkoutState {}

class WorkoutLoadingState extends WorkoutState {}

class WorkoutFailureState extends WorkoutState {
  final String error;

  const WorkoutFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WorkoutFailureState { error: $error }';
}
