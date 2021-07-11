import 'package:flutter/material.dart';

class CarouselScannedItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget image;
  const CarouselScannedItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 139,
      height: 199,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [
            Color(0xFF97B88D),
            Color(0xFFA1C6B8),
            Color(0xFF64919F),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 8.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              image,
            ],
          ),
        ),
      ),
    );
  }
}
