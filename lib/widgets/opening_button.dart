import 'package:flutter/material.dart';

// class OpeningButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Widget child;

//   const OpeningButton({
//     Key? key,
//     required this.onPressed,
//     required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: child,
//       style: ElevatedButton.styleFrom(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           primary: Color(0xFF97AC94),
//           padding: EdgeInsets.only(
//               left: 41, right: 41, top: 14, bottom: 20) // foreground
//           ),
//     );
//   }
// }

class OpeningButton extends StatelessWidget {
  const OpeningButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          SizedBox(
            height: 50,
            width: 150,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7C9882),
                    Color(0xFFACC9AE),
                    Color(0xFF4F8190),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 9),
            child: Positioned(
              bottom: 10,
              child: Text(
                text,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
