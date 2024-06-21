import 'package:flutter/material.dart';

import '../../resource/colors_data.dart';
import '../../resource/const/sized_font.dart';
import '../../resource/const/sized_font_weight.dart';
import '../../resource/styles.dart';

class TabBarCustom extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool selected;
  const TabBarCustom({
    Key? key,
    required this.title,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selected
                    ? ColorsCustom.primaryColor.green
                    : ColorsCustom.othersColor.darkGrey30,
                width: 1.5,
              ),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyleHeading.textH6XSmall.copyWith(
                fontWeight: SizedFontWeight.boldHeavy,
                color: selected
                    ? ColorsCustom.primaryColor.orange
                    : ColorsCustom.othersColor.darkGrey30,
                fontSize: SizedFont.headingH6,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
