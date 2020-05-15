import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/buttons/button_widget.dart';
import 'package:r_train/widgets/text_field/text_field_widget.dart';

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
            body: bodyWidget(context),
          ),
        ),
      );
    }));
  }

  Widget bodyWidget(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    AppLocalizations.of(context).translate('greetings_to_you'),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    AppLocalizations.of(context).translate('how_can_i_call_you'),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFieldMainWidget(
                      textController: TextEditingController(),
                      fieldName:
                          AppLocalizations.of(context).translate('your_name'),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text(
                    AppLocalizations.of(context)
                        .translate('please_choose_an_avatar'),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      itemCount: 16,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio:
                              (((MediaQuery.of(context).size.width) / 3) - 40) /
                                  (MediaQuery.of(context).size.height * 0.09)),
                      itemBuilder: (context, index) {
                        return Image.asset('assets/avatars/128_${index +1}.png');
                      }),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MainButtonWidget(
                      func: () {},
                      color: ColorPalette.lightColor,
                      title: AppLocalizations.of(context).translate('enter'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
