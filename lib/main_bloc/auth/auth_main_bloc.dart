import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      try {
        await _dbProvider.getUser();
        yield AuthMainAuthMainenticated();
      } catch (error) {
        yield AuthMainUnauthenticated();
      }
    }

    if (event is LoggedInEvent) {
      yield AuthMainAuthMainenticated();
    }
    if (event is LoggedOutEvent) {
      yield AuthMainUnauthenticated();
    }
  }
}
