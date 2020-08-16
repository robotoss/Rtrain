import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r_train/data/model/program_with_time.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState(indexScreen: 0, trainSeconds: 0));

  int indexScreen = 0;

  List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  // Инициализирую базу данных
  RtrainBaseDao _dbProvider;
  // Данные для тренеровки
  ProgramWithTime programData;
  // Активный шаг тренеровки
  int activeTimeStep = 0;
  // Время этап тренеровки
  int activeSeconds;

  Timer timer;

  List<int> list = [5, 3, 5];

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    if (event is ChangeTabEvent) {
      yield* _buildChangeTabEvent(event.tabId);
    }
    if (event is InitialMainDataEvent) {
      yield* _buildCInitialMainDataEvent(event.context);
    }
    if (event is InitialMainDataEvent) {
      yield* _buildCInitialMainDataEvent(event.context);
    }
    if (event is StartWorkoutEvent) {
      yield* _buildStartWorkoutEvent();
    }
    if (event is UpdateWorkoutEvent) {
      yield* _buildUpdateWorkoutEvent();
    }
    if (event is FinishStepEvent) {
      yield* _buildFinishStepEvent();
    }
  }

  Stream<MainState> _buildCInitialMainDataEvent(BuildContext context) async* {
    //Инициализирую базу данных
    _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);
  }

  Stream<MainState> _buildChangeTabEvent(int tabId) async* {
    if (indexScreen == tabId) {
      getNavKey(indexScreen)..currentState.popUntil((route) => route.isFirst);
    }
    indexScreen = tabId;
    yield MainInitialState(
        indexScreen: indexScreen, trainSeconds: activeSeconds);
  }

  Stream<MainState> _buildStartWorkoutEvent() async* {
    activeSeconds = list[activeTimeStep];
    add(UpdateWorkoutEvent());
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (activeSeconds == 0) {
        timer.cancel();
        add(FinishStepEvent());
      } else {
        activeSeconds = activeSeconds - 1;
        add(UpdateWorkoutEvent());
      }
    });
  }

  Stream<MainState> _buildUpdateWorkoutEvent() async* {
    yield MainInitialState(indexScreen: 0, trainSeconds: activeSeconds);
  }

  Stream<MainState> _buildFinishStepEvent() async* {
    add(UpdateWorkoutEvent());
    activeTimeStep++;
    add(StartWorkoutEvent());
  }

  GlobalKey<NavigatorState> getNavKey(int id) {
    return navigatorKeys[id];
  }
}
