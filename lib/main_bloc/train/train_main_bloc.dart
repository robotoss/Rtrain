import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'train_main_event.dart';
part 'train_main_state.dart';

class TrainMainBloc extends Bloc<TrainMainEvent, TrainMainState> {
  @override
  TrainMainState get initialState => TrainMainInitial();

  @override
  Stream<TrainMainState> mapEventToState(
    TrainMainEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
