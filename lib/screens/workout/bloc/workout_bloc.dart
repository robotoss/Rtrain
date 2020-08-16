import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:r_train/data/model/program_with_time.dart';
import 'package:r_train/database/database_rtrain_dao.dart';
import 'package:r_train/screens/main/bloc/main_bloc.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final MainBloc mainBloc;
  final ProgramStep programStep;
  WorkoutBloc({@required this.programStep, @required this.mainBloc})
      : super(WorkoutLoadingState());

  // Инициализирую базу данных
  RtrainBaseDao _dbProvider;
  // Данные для тренеровки
  ProgramWithTime programData;
  // Active time step
  int activeTimeStep = 0;

  List<int> list = [3, 2, 3];

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is WorkoutLoadMainDataEvent) {
      yield* _buildWorkoutLoadMainDataEvent(event.context);
    }
    if (event is StartTimerEvent) {
      yield* _buildStartButtonPressedEvent();
    }
    if (event is NextTimeStepEvent) {
      yield* _buildNextTimeStepEvent();
    }
  }

  Stream<WorkoutState> _buildWorkoutLoadMainDataEvent(
      BuildContext context) async* {
    // _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);
    // // Check avalible programs
    // programData = await _dbProvider.getProgramsStep(programStep.id);
    // print(programData);

    yield WorkoutInitialState(showTimer: false);
  }

  Stream<WorkoutState> _buildStartButtonPressedEvent() async* {
    // yield WorkoutTimerShowState(workoutTime: list[activeTimeStep]);
    mainBloc.add(StartWorkoutEvent());
    yield WorkoutInitialState(showTimer: true);
  }

  Stream<WorkoutState> _buildNextTimeStepEvent() async* {
    if (activeTimeStep < programData.trainigTime.length) {
      yield WorkoutInitialState(showTimer: false);
      yield WorkoutInitialState(showTimer: true);
    } else {
      yield WorkoutInitialState(showTimer: false);
    }
  }
}
