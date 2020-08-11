part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class ChangeTabEvent extends MainEvent {
  final int tabId;

  const ChangeTabEvent({
    @required this.tabId,
  });
}
