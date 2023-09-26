import 'package:bmi/size_config.dart';
import 'package:flutter/material.dart';

class ReUsable extends StatelessWidget {
  const ReUsable({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(getWidth(10)),
      child: child,
    );
  }
}