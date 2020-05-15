part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AvatarPresedEvent extends AuthEvent {
  final int avatarIndex;

  const AvatarPresedEvent({@required this.avatarIndex});

  @override
  List<Object> get props => [avatarIndex];

  @override
  String toString() => 'AuthFailureState { avatarIndex: $avatarIndex }';
}

class EnterButtonPressedEvent extends AuthEvent {
  final BuildContext context;

  const EnterButtonPressedEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'EnterButtonPressedEvent { context: $context }';
}
