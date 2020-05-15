import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final _dbProvider =
          Provider.of<RtrainBaseDao>(event.context, listen: false);
      try {
        await _dbProvider.getUser();
        yield AuthUnauthenticated();
      } catch (error) {
        yield AuthUnauthenticated();
      }
    }

    if (event is LoggedInEvent) {
      yield AuthAuthenticated();
    }
    if (event is LoggedOutEvent) {
      yield AuthUnauthenticated();
    }
  }
}
