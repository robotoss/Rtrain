part of 'auth_main_bloc.dart';

abstract class AuthMainEvent extends Equatable {
  const AuthMainEvent();

  @override
  List<Object> get props => [];
}

class AppStartedEvent extends AuthMainEvent {
  final BuildContext context;
  const AppStartedEvent({@required this.context});
}

class AddDataToDatabaseEvent extends AuthMainEvent {
  final RtrainBaseDao dbProvider;
  const AddDataToDatabaseEvent({@required this.dbProvider});
}

class LoggedInEvent extends AuthMainEvent {}

class LoggedOutEvent extends AuthMainEvent {
  final BuildContext context;
  const LoggedOutEvent({@required this.context});
}
