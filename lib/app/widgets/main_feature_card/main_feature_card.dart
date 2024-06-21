import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainFeatureCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final GestureTapCallback onTap;

  const MainFeatureCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 20),
        width: Get.width - 40,
        decoration: BoxDecoration(
          color: Color(0xffF1B808).withOpacity(.75),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Color(0xff000000).withOpacity(.24),
                offset: Offset(0, 4))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width / 2,
                  child: Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              icon,
              size: 65,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
