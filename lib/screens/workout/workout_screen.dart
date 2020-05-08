import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Scaffold(
          backgroundColor: ColorPalette.mainBackground,
          appBar: gradientAppBar(context, 'Workout'),
        );
      }),
    );
  }

}
