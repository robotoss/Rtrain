import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:r_train/database/database_rtrain_dao.dart';
import 'package:r_train/main_bloc/auth/auth_main_bloc.dart';
import 'package:r_train/theme/main_theme.dart';

import 'localizations/app_localizations.dart';
import 'screens/auth/auth_screen.dart';
import 'screens/calendar/calendar_screen.dart';
import 'screens/workout/workout_screen.dart';

void main() {
  //System statusbar theme
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(Provider<RtrainBaseDao>(
    create: (_) => RtrainDatabase().rtrainBaseDao,
    child: MultiBlocProvider(
      providers: [
        BlocProvider<AuthMainBloc>(
          create: (BuildContext context) =>
              AuthMainBloc()..add(AppStartedEvent(context: context)),
        ),
      ],
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set system orientation
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Rtrainer',
      theme: mainTheme,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ru', 'BY'),
        Locale('ru', 'KG'),
        Locale('ru', 'KZ'),
        Locale('ru', 'MD'),
        Locale('ru', 'RU'),
        Locale('ru', 'UA'),
      ],
      // These delegates make sure that the localization data for the proper language is loaded
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        AppLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: BlocBuilder<AuthMainBloc, AuthMainState>(builder: (context, state) {
        if (state is AuthMainUninitialized) {
          return Container();
        }
        if (state is AuthMainAuthMainenticated) {
          return CalendarScreen();
        }
        if (state is AuthMainUnauthenticated) {
          return AuthScreen();
        } else {
          return Container();
        }
      }),
    );
  }
}
