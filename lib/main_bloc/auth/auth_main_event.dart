part of 'auth_main_bloc.dart';

abstract class AuthMainEvent extends Equatable {
  const AuthMainEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthMainEvent {
  final BuildContext context;
  const AppStartedEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'AppStartedEvent { context: $context }';
}

class LoggedInEvent extends AuthMainEvent {}

class LoggedOutEvent extends AuthMainEvent {
  final BuildContext context;
  const LoggedOutEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'LoggedOutEvent { context: $context }';
}
