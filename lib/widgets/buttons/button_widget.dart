import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final Function func;
  final Color color;
  final String title;
  MainButtonWidget({this.func, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 300.0,
      height: 50.0,
      child: RaisedButton(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        onPressed: func,
        color: color,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
    );
  }
}
