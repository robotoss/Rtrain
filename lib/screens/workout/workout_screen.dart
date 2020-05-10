import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/appBar/appBar_widget.dart';
import 'package:r_train/widgets/drawer/drawer_widget.dart';

import 'bloc/workout_bloc.dart';

class WorkoutScreen extends StatelessWidget {
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutBloc>(
      create: (context) {
        return WorkoutBloc()..add(WorkoutLaodMainDataEvent());
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        return Container(
          color: ColorPalette.mainBackground,
          child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorPalette.mainBackground,
              appBar: gradientAppBar(context, 'workout', drawerKey),
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

  Widget body(BuildContext context, WorkoutState state) {
    if (state is WorkoutInitialState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 1),
          startButton(context),
          bottomInfoBar(context)
        ],
      );
    } else if (state is WorkoutActiveState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 1),
          bottomInfoBar(context)
        ],
      );
    } else {
      return Container();
    }
  }

  Widget startButton(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<WorkoutBloc>(context).add(StartButtonPressedEvent()),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.mainColorFirst, width: 2),
            shape: BoxShape.circle),
        child: Center(
          child: Text(
            AppLocalizations.of(context).translate('start'),
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  Widget bottomInfoBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                AppLocalizations.of(context).translate('last_workout'),
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.date_range,
                      color: ColorPalette.negativeColor,
                    ),
                  ),
                  Text(
                    '27.04.2014',
                    style: TextStyle(
                        color: ColorPalette.negativeColor, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.restore,
                      color: ColorPalette.negativeColor,
                    ),
                  ),
                  Text(
                    '0:35:11',
                    style: TextStyle(
                        color: ColorPalette.negativeColor, fontSize: 16),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: ColorPalette.negativeColor),
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                bottomBarItem(context, 'ic_run', 'steps', 8214),
                SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: ColorPalette.negativeColor,
                      width: 1,
                    )),
                bottomBarItem(context, 'ic_fire', 'cal', 8214),
                SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: ColorPalette.negativeColor,
                      width: 1,
                    )),
                bottomBarItem(context, 'ic_distance', 'km', 8214),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBarItem(
      BuildContext context, String icon, String title, double value) {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(
              'assets/icons_svg/$icon.svg',
              width: 38,
              height: 38,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$value',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                AppLocalizations.of(context).translate(title),
                style:
                    TextStyle(color: ColorPalette.negativeColor, fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
