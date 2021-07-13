import 'package:flutter/material.dart';

class OpeningButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const OpeningButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          primary: Color(0xFF97AC94),
          padding: EdgeInsets.only(
              left: 41, right: 41, top: 14, bottom: 20) // foreground
          ),
    );
  }
}
