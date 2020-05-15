import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/theme/main_theme.dart';

import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(create: (context) {
      return AuthBloc();
    }, child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Container(
        color: ColorPalette.mainBackground,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorPalette.mainBackground,
            body: bodyWidget(context),
          ),
        ),
      );
    }));
  }
  Widget bodyWidget(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('greetings_to_you'),
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
