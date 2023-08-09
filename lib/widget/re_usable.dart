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
      margin: EdgeInsets.all(5),
      child: child,
    );
  }
}