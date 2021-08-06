import 'package:flutter/material.dart';

class Circles extends StatefulWidget {
  double tween;
  Circles({required this.tween});

  @override
  _CirclesState createState() => _CirclesState();
}

class _CirclesState extends State<Circles> {


  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.6,
      child: CircleAvatar(
        maxRadius: widget.tween!=null?
        80*widget.tween:70,
        backgroundColor: Colors.green,
      ),
    );
  }
}