part of 'train_main_bloc.dart';

abstract class TrainMainEvent extends Equatable {
  const TrainMainEvent();

  @override
  List<Object> get props => [];
}

class StartWorkoutEvent extends TrainMainEvent {
  final ProgramStep programStep;
  StartWorkoutEvent({@required this.programStep});
}

class PauseWorkoutEvent extends TrainMainEvent {}

class ResumeWorkoutEvent extends TrainMainEvent {}

class CancelWorkoutEvent extends TrainMainEvent {}

class WorkoutSecondsUpdate extends TrainMainEvent {}

class InitialMainDataEvent extends TrainMainEvent {
  final BuildContext context;
  InitialMainDataEvent({@required this.context});
}
