import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:r_train/database/database_rtrain_dao.dart';
import 'package:r_train/main_bloc/auth/auth_main_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthMainBloc authMainBloc;
  AuthBloc({@required this.authMainBloc})
      : super(AuthInitialState(
            textEditingController: TextEditingController(), activeAvatar: 1));

  TextEditingController nameTextController = TextEditingController();

  int activeAvatar = 1;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AvatarPresedEvent) {
      yield* _buildAvatarPresedEvent(event.avatarIndex);
    }
    if (event is EnterButtonPressedEvent) {
      yield* _buildEnterButtonPressedEvent(event.context);
    }
  }

  Stream<AuthState> _buildAvatarPresedEvent(int avatarIndex) async* {
    activeAvatar = avatarIndex;

    yield AuthInitialState(
        textEditingController: nameTextController, activeAvatar: activeAvatar);
  }

  Stream<AuthState> _buildEnterButtonPressedEvent(BuildContext context) async* {
    final _dbProvider = Provider.of<RtrainBaseDao>(context, listen: false);

    if (nameTextController.text.isEmpty) {
      yield AuthFailureState(error: 'failed_enter_name');
    } else {
      await _dbProvider.insertUser(User(
          id: 0,
          userName: nameTextController.text,
          userImg: '128_$activeAvatar.png'));

      authMainBloc.add(LoggedInEvent());
    }

    yield AuthInitialState(
        textEditingController: nameTextController, activeAvatar: activeAvatar);
  }
}
