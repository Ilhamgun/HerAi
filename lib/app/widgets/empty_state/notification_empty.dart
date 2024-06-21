import 'package:flutter/material.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/const/sized_font_weight.dart';
import 'package:herai/app/resource/const/sized_space.dart';
import 'package:herai/app/resource/styles.dart';

class EmptyStateNotification extends StatelessWidget {
  const EmptyStateNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image.asset('assets/images/notifications.png'),

            //  RenderSvgFile(
            //   pathImage: "assets/illustration/notificationEmpty.svg",
            //   height: 150,
            //   width: 150,
            // ),
          ),
          SizedBox(
            height: SizedSpace.sizedLightBig,
          ),
          Text(
            'Tidak ada notifikasi',
            style: TextStyleHeading.textH5Small.copyWith(
              fontWeight: SizedFontWeight.boldHeavy,
              color: ColorsCustom.textcolorDark,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizedSpace.sizedLarge,
          ),
        ],
      ),
    );
  }
}
