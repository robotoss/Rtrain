import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_timer_bloc.dart';

class WorkoutTimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutTimerBloc>(create: (context) {
      return WorkoutTimerBloc()..add(StartTimerEvent());
    }, child: BlocBuilder<WorkoutTimerBloc, WorkoutTimerState>(
        builder: (context, state) {
      if (state is WorkoutTimerInitialState) {
        final String minutesStr =
            ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
        final String secondsStr =
            (state.duration % 60).floor().toString().padLeft(2, '0');
        return Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.width / 1.5,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.width / 1.5,
                child: Transform.rotate(
                  angle: pi / 0.75,
                  child: CustomPaint(
                    foregroundPainter: MyPainter(
                        lineColor: Colors.transparent,
                        completeColor: Colors.blueAccent,
                        completePercent: state.percent,
                        width: 10.0),
                  ),
                ),
              ),
              Center(child: 
              Text(
                '$minutesStr:$secondsStr',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
                )),
            ],
          ),
        );
      } else {
        return Container();
      }
    }));
  }
}

class MyPainter extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;
  MyPainter(
      {this.lineColor, this.completeColor, this.completePercent, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (completePercent / 150);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
