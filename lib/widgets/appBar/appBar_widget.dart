import 'package:flutter/material.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/theme/main_theme.dart';

Widget gradientAppBar(BuildContext context, String title) {
  return PreferredSize(
    child: Container(
      height: AppBar().preferredSize.height + MediaQuery.of(context).padding.top,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 15.0, bottom: 10.0, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.menu, color: Colors.white,),
            Text(
                AppLocalizations.of(context).translate(title),
                style: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.white),
              ),
              Container(width: 1)
          ],
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorPalette.mainColorFirst,
                ColorPalette.mainColorSecond
              ]),
          ),
    ),
    preferredSize: Size(MediaQuery.of(context).size.width, 150.0),
  );
}
