import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String btnTitle;
  final Function onPressed;
  final Color color;

  MyButton({this.btnTitle, this.onPressed, this.color = Colors.indigo});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        btnTitle,
        style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 1.2,
        ),
      ),
      onPressed: onPressed,
      color: color,
      textColor: Colors.white,
      minWidth: 300,
      height: 70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
    );
  }
}
