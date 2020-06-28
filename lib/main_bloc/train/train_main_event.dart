part of 'train_main_bloc.dart';

abstract class TrainMainEvent extends Equatable {
  const TrainMainEvent();

  @override
  List<Object> get props => [];
}

class StartWorkoutEvent extends TrainMainEvent {}
