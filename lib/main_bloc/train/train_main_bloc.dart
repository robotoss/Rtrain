import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:r_train/data/model/program_with_time.dart';
import 'package:r_train/database/database_rtrain_dao.dart';

part 'train_main_event.dart';
part 'train_main_state.dart';

class TrainMainBloc extends Bloc<TrainMainEvent, TrainMainState> {
  TrainMainBloc() : super(TrainMainInitial(duration: 0));

  // Pedometer _pedometer;
  // StreamSubscription<int> _subscription;

  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;

  // Инициализирую базу данных
  RtrainBaseDao _dbProvider;
  // Данные для тренеровки
  ProgramWithTime programData;
  // Active time step
  int activeTimeStep = 0;
  int activeSeconds;

  List<int> list = [3, 2, 3];

  int steps;

  Timer timer;

  @override
  Stream<TrainMainState> mapEventToState(
    TrainMainEvent event,
  ) async* {
    if (event is InitialMainDataEvent) {
      yield* _buildInitialMainDataEvent(event.context);
    }
    if (event is StartWorkoutEvent) {
      yield* _buildStartWorkoutEvent(event.programStep);
    }
    if (event is PauseWorkoutEvent) {
      yield* _buildPauseWorkoutEvent();
    }
    if (event is ResumeWorkoutEvent) {
      yield* _buildResumeWorkoutEvent();
    }
    if (event is CancelWorkoutEvent) {
      yield* _buildCancelWorkoutEvent();
    }

    if (event is WorkoutSecondsUpdate) {
      yield* _buildWorkoutSecondsUpdate();
    }
  }

  Stream<TrainMainState> _buildInitialMainDataEvent(
      BuildContext context) async* {
    _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);
  }

  Stream<TrainMainState> _buildStartWorkoutEvent(
      ProgramStep programStep) async* {
    // Check avalible programs
    programData = await _dbProvider.getProgramsStep(programStep.id);
    activeSeconds = list[activeTimeStep];

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (activeSeconds == 0) {
        timer.cancel();
        add(WorkoutSecondsUpdate());
      } else {
        activeSeconds = activeSeconds - 1;
        add(WorkoutSecondsUpdate());
      }
    });

    // _pedometer = new Pedometer();
    // _subscription = _pedometer.pedometerStream.listen((int stepCountValue) {
    //   print(stepCountValue);
    // }, onError: (error) {
    //   print("Flutter Pedometer Error: $error");
    // }, onDone: () {
    //   print("Finished pedometer tracking");
    // }, cancelOnError: true);

    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    /// Listen to streams and handle errors
    _stepCountStream.listen((event) {
      steps = event.steps;
      DateTime timeStamp = event.timeStamp;
    }).onError((error) {});

    _pedestrianStatusStream.listen((event) {
      String status = event.status;
      DateTime timeStamp = event.timeStamp;
    }).onError((error) {});
  }

  Stream<TrainMainState> _buildPauseWorkoutEvent() async* {}

  Stream<TrainMainState> _buildResumeWorkoutEvent() async* {}

  Stream<TrainMainState> _buildCancelWorkoutEvent() async* {}

  Stream<TrainMainState> _buildWorkoutSecondsUpdate() async* {
    yield TrainMainInitial(duration: activeSeconds);
  }
}
