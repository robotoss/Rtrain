import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_train/data/model/program_with_time.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  final ProgramStep programStep;
  WorkoutBloc({@required this.programStep}) : super(WorkoutLoadingState());

  // Инициализирую базу данных
  RtrainBaseDao _dbProvider;
  // Данные для тренеровки
  ProgramWithTime programData;

  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is WorkoutLoadMainDataEvent) {
      yield* _buildWorkoutLoadMainDataEvent(event.context);
    }
    if (event is StartButtonPressedEvent) {
      yield* _buildStartButtonPressedEvent();
    }
  }

  Stream<WorkoutState> _buildWorkoutLoadMainDataEvent(
      BuildContext context) async* {
    _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);
    // Check avalible programs
    programData = await _dbProvider.getProgramsStep(programStep.id);
    print(programData);

    yield WorkoutInitialState();
  }

  Stream<WorkoutState> _buildStartButtonPressedEvent() async* {
    yield WorkoutActiveState();
  }
}
