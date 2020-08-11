import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState(indexScreen: 0));

  int indexScreen = 0;

  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is ChangeTabEvent) {
      yield* _buildChangeTabEvent(event.tabId);
    }
  }

  Stream<MainState> _buildChangeTabEvent(int tabId) async* {
    if (indexScreen == tabId) {
      getNavKey(indexScreen)..currentState.popUntil((route) => route.isFirst);
    }
    indexScreen = tabId;
    yield MainInitialState(indexScreen: indexScreen);
  }

  GlobalKey<NavigatorState> getNavKey(int id) {
    return navigatorKeys[id];
  }
}
