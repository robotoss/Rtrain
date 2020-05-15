part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthEvent {
  final BuildContext context;
  const AppStartedEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'AppStartedEvent { context: $context }';
}

class LoggedInEvent extends AuthEvent {}

class LoggedOutEvent extends AuthEvent {
  final BuildContext context;
  const LoggedOutEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'LoggedOutEvent { context: $context }';
}
