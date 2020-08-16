part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

class MainInitialState extends MainState {
  final int indexScreen;
  final int trainSeconds;

  MainInitialState({@required this.indexScreen, @required this.trainSeconds});

  @override
  List<Object> get props => [indexScreen, trainSeconds];

  @override
  String toString() =>
      'MainInitialState { indexScreen: $indexScreen, trainSeconds: $trainSeconds }';
}

class MainLoadingState extends MainState {}

class MainLoadingLayerState extends MainState {
  final bool isLoading;

  const MainLoadingLayerState({@required this.isLoading});

  @override
  List<Object> get props => [isLoading];

  @override
  String toString() => 'MainLoadingLayerState { isLoading: $isLoading }';
}

class MainFailureState extends MainState {
  final String error;

  const MainFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'MainFailureState { error: $error }';
}
