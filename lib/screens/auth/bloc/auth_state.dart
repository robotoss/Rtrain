part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {
  final TextEditingController textEditingController;
  final int activeAvatar;

  const AuthInitialState(
      {@required this.textEditingController, 
      @required this.activeAvatar});

  @override
  List<Object> get props => [textEditingController, activeAvatar];

  @override
  String toString() =>
      'AuthFailureState { textEditingController: $textEditingController, activeAvatar: $activeAvatar }';
}

class Auth extends AuthState {}

class AuthFailureState extends AuthState {
  final String error;

  const AuthFailureState({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'AuthFailureState { error: $error }';
}
