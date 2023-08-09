import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, this.icon, required this.press});
  final Widget? icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: press,
          child: Container(
            height: 45,
            width: 45,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Center(
              child: icon ?? SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}