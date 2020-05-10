import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/appBar/appBar_widget.dart';

import 'bloc/workout_bloc.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutBloc>(
      create: (context) {
        return WorkoutBloc();
      },
      child: BlocBuilder<WorkoutBloc, WorkoutState>(builder: (context, state) {
        return Container(
          color: ColorPalette.mainBackground,
          child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: ColorPalette.mainBackground,
              appBar: gradientAppBar(context, 'Workout'),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 1),
                    startButton(context),
                    bottomInfoBar()
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget startButton(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Start'),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.width / 1.5,
        decoration: BoxDecoration(
            border: Border.all(color: ColorPalette.mainColorFirst, width: 2),
            shape: BoxShape.circle),
        child: Center(
          child: Text(
            'Start',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  Widget bottomInfoBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Last workout',
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
                bottomBarItem('ic_run', 'steps', 8214),
                SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: ColorPalette.negativeColor,
                      width: 1,
                    )),
                bottomBarItem('ic_fire', 'cal', 8214),
                SizedBox(
                    height: 30,
                    child: VerticalDivider(
                      color: ColorPalette.negativeColor,
                      width: 1,
                    )),
                bottomBarItem('ic_distance', 'km', 8214),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBarItem(String icon, String title, double value) {
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
                title,
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
