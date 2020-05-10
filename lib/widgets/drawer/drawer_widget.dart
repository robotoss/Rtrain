import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/drawer/bloc/drawer_widget_bloc.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DrawerWidgetBloc>(create: (context) {
      return DrawerWidgetBloc();
    }, child: BlocBuilder<DrawerWidgetBloc, DrawerWidgetState>(
        builder: (context, state) {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorPalette.mainColorFirst,
                  ColorPalette.mainColorSecond
                ]),
          ),
          child: Column(
            children: <Widget>[
              drawerHeader(context),
            ],
          ),
        ),
      );
    }));
  }

  Widget drawerHeader(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              ColorPalette.mainColorFirst,
              ColorPalette.mainColorSecond
            ]),
      ),
      margin: EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            drawerHeaderItem(context, 'burn', 17300),
            drawerHeaderItem(context, 'distance', 234),
          ],
        ),
      ),
    );
  }

  Widget drawerHeaderItem(BuildContext context, String title, int value) {
    return Container(
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$value ${title == 'distance' ? AppLocalizations.of(context).translate('km') : AppLocalizations.of(context).translate('cal')}',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            title == 'distance' ? AppLocalizations.of(context).translate('total_distance') : AppLocalizations.of(context).translate('total_burned'),
            style: TextStyle(fontSize: 14, color: Colors.yellow),
          )
        ],
      ),
    );
  }
}
