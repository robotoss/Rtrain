import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:r_train/localizations/app_localizations.dart';
import 'package:r_train/main_bloc/auth/auth_main_bloc.dart';
import 'package:r_train/theme/main_theme.dart';
import 'package:r_train/widgets/bloc_error/bloc_error_fragment.dart';
import 'package:r_train/widgets/buttons/button_widget.dart';
import 'package:r_train/widgets/text_field/text_field_widget.dart';

import 'bloc/auth_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) {
          return AuthBloc(authMainBloc: BlocProvider.of<AuthMainBloc>(context));
        },
        child: Container(
          color: ColorPalette.mainBackground,
          child: SafeArea(
            child: Scaffold(
              body: BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthFailureState) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context).translate(state.error),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child:
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  if (state is AuthInitialState) {
                    return bodyWidget(context, state);
                  }
                  if (state is Auth) {
                    return CircularProgressIndicator();
                  } else {
                    return BlocErrorFragment();
                  }
                }),
              ),
            ),
          ),
        ));
  }

  Widget bodyWidget(BuildContext context, AuthInitialState state) {
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
                    AppLocalizations.of(context)
                        .translate('how_can_i_call_you'),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: TextFieldMainWidget(
                      textController: state.textEditingController,
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
                      return GestureDetector(
                        onTap: () => BlocProvider.of<AuthBloc>(context)
                            .add(AvatarPresedEvent(avatarIndex: index + 1)),
                        child: Stack(
                          children: <Widget>[
                            Image.asset('assets/avatars/128_${index + 1}.png'),
                            state.activeAvatar == (index + 1)
                                ? Positioned(
                                    top: 0,
                                    right: 0,
                                    child: SvgPicture.asset(
                                      'assets/icons_svg/ic_check.svg',
                                      color: ColorPalette.mainColorSecond,
                                    ),
                                    width: 20,
                                    height: 20,
                                  )
                                : Container()
                          ],
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: MainButtonWidget(
                      func: () => BlocProvider.of<AuthBloc>(context)
                          .add(EnterButtonPressedEvent(context: context)),
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
