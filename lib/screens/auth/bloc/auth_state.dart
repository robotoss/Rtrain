part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class WorkoutTimerLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final String error;

  const AuthFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthFailureState { error: $error }';
}