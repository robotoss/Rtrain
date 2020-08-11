import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_train/screens/calendar/calendar_screen.dart';
import 'package:r_train/screens/workout/workout_screen.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/appBar/appBar_widget.dart';
import 'package:r_train/widgets/drawer/bloc/drawer_widget_bloc.dart';
import 'package:r_train/widgets/drawer/drawer_widget.dart';

import 'bloc/main_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (BuildContext context) => MainBloc()),
          BlocProvider<DrawerWidgetBloc>(create: (context) {
            return DrawerWidgetBloc();
          }),
        ],
        child: BlocListener<MainBloc, MainState>(
            listener: (context, state) {
              if (state is MainLoadingLayerState) {
                // if (state.isLoading) {
                // } else {
                //   Navigator.of(context, rootNavigator: true).pop();
                // }
              }
              if (state is MainFailureState) {}
            },
            child: BlocBuilder<MainBloc, MainState>(
                buildWhen: (previousState, state) {
              if (state is MainLoadingLayerState) {
                return false;
              } else if (state is MainFailureState) {
                return false;
              } else {
                return true;
              }
            }, builder: (context, state) {
              return Container(
                  color: Colors.red,
                  child: SafeArea(
                      top: false,
                      child: Scaffold(
                        backgroundColor: ColorPalette.mainBackground,
                        key: drawerKey,
                        appBar: gradientAppBar(context, 'calendar', drawerKey),
                        drawer: DrawerWidget(),
                        body: Builder(
                          builder: (context) {
                            if (state is MainState) {
                              return bodyWidget(context, state);
                            } else {
                              return Container();
                            }
                          },
                        ),
                      )));
            })));
  }

  Widget bodyWidget(BuildContext context, MainInitialState state) {
    return IndexedStack(
      index: state.indexScreen,
      children: <Widget>[
        Navigator(
          key: BlocProvider.of<MainBloc>(context).navigatorKeys[0],
          onGenerateRoute: (route) => MaterialPageRoute(
              settings: route, builder: (context) => CalendarScreen()),
        ),
      ],
    );
  }
}
