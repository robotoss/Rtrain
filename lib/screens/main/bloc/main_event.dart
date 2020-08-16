part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class InitialMainDataEvent extends MainEvent {
  final BuildContext context;

  InitialMainDataEvent({
    @required this.context,
  });
}

class ChangeTabEvent extends MainEvent {
  final int tabId;

  ChangeTabEvent({
    @required this.tabId,
  });
}

class StartWorkoutEvent extends MainEvent {
  // final ProgramStep programStep;
  // StartWorkoutEvent({@required this.programStep});
}

class FinishStepEvent extends MainEvent {}

class UpdateWorkoutEvent extends MainEvent {}
