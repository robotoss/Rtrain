part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutInitialState extends WorkoutState {
  final bool showTimer;

  const WorkoutInitialState({
    @required this.showTimer,
  });

  @override
  List<Object> get props => [showTimer];
}

// class WorkoutTimerShowState extends WorkoutState {
//   final int workoutTime;
//   final bool showTimer;

//   const WorkoutTimerShowState({
//     @required this.workoutTime,
//     @required this.showTimer,
//   });

//   @override
//   List<Object> get props => [workoutTime, showTimer];
// }

class WorkoutLoadingState extends WorkoutState {}

class WorkoutFailureState extends WorkoutState {
  final String error;

  const WorkoutFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'WorkoutFailureState { error: $error }';
}
