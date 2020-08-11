part of 'workout_timer_bloc.dart';

abstract class WorkoutTimerEvent extends Equatable {
  const WorkoutTimerEvent();

  @override
  List<Object> get props => [];
}

class StartTimerSecEvent extends WorkoutTimerEvent {}

class UpdateTimerEvent extends WorkoutTimerEvent {}

class StopTimerEvent extends WorkoutTimerEvent {
  final BuildContext context;
  StopTimerEvent({@required this.context});
}
