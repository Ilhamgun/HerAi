import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/styles.dart';

class ButtonCustom extends StatelessWidget {
  double? width;
  double? height;
  String text;
  Color textColor;

  Color color;
  Color borderColor;
  double borderRadius;
  final GestureTapCallback onTap;

  ButtonCustom({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.textColor = Colors.white,
    required this.color,
    this.borderColor = Colors.transparent,
    required this.onTap,
    this.borderRadius = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        // margin: EdgeInsets.only(bottom: 24, left: 16, right: 16),

        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0xff000000).withOpacity(.24),
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Text(
          text.tr,
          textAlign: TextAlign.center,
          style: TextStyleHeading.textH6XSmall.copyWith(color: textColor),
        ),
      ),
    );
  }
}
