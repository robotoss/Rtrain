part of 'auth_main_bloc.dart';

abstract class AuthMainState extends Equatable {
  const AuthMainState();

  @override
  List<Object> get props => [];
}

class AuthMainUninitialized extends AuthMainState {}

class AuthMainAuthMainenticated extends AuthMainState {}

class AuthMainUnauthenticated extends AuthMainState {}

class AuthMainUnregister extends AuthMainState {}

class AuthMainLoadingState extends AuthMainState {}