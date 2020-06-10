import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/appBar/appBar_widget.dart';
import 'package:r_train/widgets/drawer/drawer_widget.dart';

import 'bloc/calendar_bloc.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key key}) : super(key: key);

  static GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarBloc>(
      create: (context) {
        return CalendarBloc()..add(CalendarLaodMainDataEvent(context: context));
      },
      child:
          BlocBuilder<CalendarBloc, CalendarState>(builder: (context, state) {
        return Container(
          color: ColorPalette.mainBackground,
          child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorPalette.mainBackground,
              appBar: gradientAppBar(context, 'calendar', drawerKey),
              key: drawerKey,
              drawer: DrawerWidget(),
              body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: body(context, state)),
            ),
          ),
        );
      }),
    );
  }

  Widget body(BuildContext context, CalendarState state) {
    if (state is CalendarInitialState) {
      return ListView.builder(
        itemCount: state.programSteps.length,
        itemBuilder: (context, index){
          return Text('1234');
        }
        );
    } else {
      return Container();
    }
  }
}
