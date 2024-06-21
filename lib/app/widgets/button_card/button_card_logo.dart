import 'package:flutter/material.dart';

class ButtonCardLogo extends StatelessWidget {
  final String image;
  final GestureTapCallback onTap;
  const ButtonCardLogo({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.green.shade300)),
        height: 50,
        width: 70,
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
