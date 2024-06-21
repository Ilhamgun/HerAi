import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/const/sized_font_weight.dart';
import 'package:herai/app/resource/styles.dart';

class CardOnboardingStyle extends StatelessWidget {
  final String title;
  final String subTitle;
  final String pathImage;
  const CardOnboardingStyle(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.pathImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Image.asset(
            pathImage,
            width: Get.width,
            height: 250,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: pathImage.contains('onboarding3')
              ? EdgeInsets.only(bottom: 0)
              : EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyleHeading.textH5Small.copyWith(
                  fontWeight: SizedFontWeight.boldHeavy,
                  color: PrimaryColor().green,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                subTitle,
                style: TextStyleParagraph.textParagraphDefault
                    .copyWith(color: ColorsCustom.othersColor.darkGrey20),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
