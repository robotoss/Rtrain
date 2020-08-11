import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:r_train/database/database_rtrain_dao.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/screens/workout/workout_screen.dart';
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
              body: body(context, state),
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
          itemBuilder: (context, index) {
            return calendarItem(context, state.programSteps[index], index,
                state.programSteps.length);
          });
    } else {
      return Container();
    }
  }

  Widget calendarItem(
      BuildContext context, ProgramStep programStep, int index, int length) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          index == 0 ? SizedBox(height: 20) : Container(),
          Row(
            children: <Widget>[
              Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    color: !programStep.isRest
                        ? ColorPalette.mainColorFirst
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: ColorPalette.mainColorFirst)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            WorkoutScreen(programStep: programStep)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: ColorPalette.stepCalendarBackground),
                    child: programStep.isRest
                        ? restField(context)
                        : workField(context, programStep),
                  ),
                ),
              )
            ],
          ),
          index != length - 1
              ? Container(
                  height: 50,
                  width: 17,
                  child: VerticalDivider(width: 1, color: Colors.white))
              : SizedBox(
                  height: 20,
                )
        ],
      ),
    );
  }

  Widget restField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons_svg/ic_rest.svg',
            height: 30,
          ),
          Text(
            AppLocalizations.of(context).translate('rest'),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget workField(BuildContext context, ProgramStep programStep) {
    int _week = programStep.id ~/ 7 + 1;
    int _day = (programStep.id - ((_week - 1) * 7)) ~/ 2 + 1;

    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            'assets/icons_svg/ic_runner.svg',
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              '${AppLocalizations.of(context).translate('week')} $_week, ${AppLocalizations.of(context).translate('day')} $_day',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
