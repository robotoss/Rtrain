import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_widget_event.dart';
part 'drawer_widget_state.dart';

class DrawerWidgetBloc extends Bloc<DrawerWidgetEvent, DrawerWidgetState> {
  DrawerWidgetBloc() : super(DrawerWidgetInitial());

  @override
  Stream<DrawerWidgetState> mapEventToState(
    DrawerWidgetEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
