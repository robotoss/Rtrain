import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  @override
  CalendarState get initialState =>
      CalendarInitialState(programSteps: programSteps);

  List<ProgramStep> programSteps = List();

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    if (event is CalendarLaodMainDataEvent) {
      yield* _buildCalendarLaodMainDataEvent(event.context);
    }
  }

  Stream<CalendarState> _buildCalendarLaodMainDataEvent(
      BuildContext context) async* {
    final _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);

    programSteps = await _dbProvider.getProgramsSteps();

    yield CalendarInitialState(programSteps: programSteps);
  }
}
