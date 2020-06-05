import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_train/data/program_data.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'auth_main_event.dart';
part 'auth_main_state.dart';

class AuthMainBloc extends Bloc<AuthMainEvent, AuthMainState> {
  @override
  AuthMainState get initialState => AuthMainUninitialized();

  @override
  Stream<AuthMainState> mapEventToState(
    AuthMainEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final _dbProvider =
          Provider.of<RtrainBaseDao>(event.context, listen: false);
      // Check avalible programs
      var runProgramms = await _dbProvider.getAllPrograms();
      if (runProgramms.isEmpty) {
        add(AddDataToDatabaseEvent(dbProvider: _dbProvider));
      }
      var user = await _dbProvider.getUser();
      if (user != null) {
        yield AuthMainAuthMainenticated();
      } else {
        yield AuthMainUnauthenticated();
      }
    }
    if (event is AddDataToDatabaseEvent) {
      yield* _buildAddDataToDatabaseEvent(event.dbProvider);
    }

    if (event is LoggedInEvent) {
      yield AuthMainAuthMainenticated();
    }
    if (event is LoggedOutEvent) {
      yield AuthMainUnauthenticated();
    }
  }

  Stream<AuthMainState> _buildAddDataToDatabaseEvent(RtrainBaseDao _dbProvider) async* {
    //Add new program
    _dbProvider.insertRunningProgram(RunningProgram(id: 0, programName:  '5_km'));
    //Add new steps
    _dbProvider.insertMultipleProgramsSteps(programSteps5Km);
    //Add new ttaning time
    _dbProvider.insertMultipleTimeParts(trainingTime5Km);

  }
}
