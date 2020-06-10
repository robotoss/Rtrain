part of 'calendar_bloc.dart';

abstract class CalendarState extends Equatable {
  const CalendarState();

  @override
  List<Object> get props => [];
}

class CalendarInitialState extends CalendarState {
  final List<ProgramStep> programSteps;

  const CalendarInitialState({@required this.programSteps});

  @override
  List<Object> get props => [programSteps];

  @override
  String toString() => 'CalendarInitialState { programSteps: $programSteps }';
}
