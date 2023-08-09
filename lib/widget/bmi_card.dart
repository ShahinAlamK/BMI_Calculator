import 'package:flutter/material.dart';

class BMCard extends StatelessWidget {
  const BMCard({super.key, this.text, this.icon,});
  final Widget? text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon ?? SizedBox(),
        SizedBox(height: 5,),
        text ?? SizedBox()
      ],
    );
  }
}