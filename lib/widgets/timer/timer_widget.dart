import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int seconds;
  final Function callBackFunc;
  TimerWidget({Key key, @required this.seconds, @required this.callBackFunc})
      : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int duration;
  Timer timer;
  double percent = 0.0;

  @override
  void initState() {
    super.initState();
    duration = widget.seconds;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      double onePercent = 100 / widget.seconds;
      if (duration == 0) {
        setState(() {
          timer.cancel();
          percent = 100;
          widget.callBackFunc();
        });
      } else {
        setState(() {
          duration = duration - 1;
          percent = (widget.seconds - duration) * onePercent;
        });
        // add(UpdateTimerEvent());
      }
    });
  }

  String minutes(int _duration) {
    return ((_duration / 60) % 60).floor().toString().padLeft(2, '0');
  }

  String seconds(int _duration) {
    return (_duration % 60).floor().toString().padLeft(2, '0');
  }

  @override
  void dispose() {
    super.dispose();
    percent = 0.0;
  }

  @override
  Widget build(BuildContext context) {
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
                    completePercent: percent,
                    width: 10.0),
              ),
            ),
          ),
          Center(
              child: Text(
            '${minutes(duration)}:${seconds(duration)}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          )),
        ],
      ),
    );
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
