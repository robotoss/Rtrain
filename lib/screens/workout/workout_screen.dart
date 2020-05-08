import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          appBar: appBard(),
        );
      }),
    );
  }

  Widget appBard() {
    return AppBar();
  }
}
