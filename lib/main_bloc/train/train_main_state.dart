part of 'train_main_bloc.dart';

abstract class TrainMainState extends Equatable {
  const TrainMainState();

  @override
  List<Object> get props => [];
}

class TrainMainInitial extends TrainMainState {
  final int duration;

  const TrainMainInitial({@required this.duration});

  @override
  List<Object> get props => [duration];

  @override
  String toString() => 'TrainMainInitial { duration: $duration }';
}
