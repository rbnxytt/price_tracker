import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color,
  }) : super(key: key);

  final void Function() onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 30.0,
        width: 120,
        decoration: BoxDecoration(
          color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
