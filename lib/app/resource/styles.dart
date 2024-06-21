import 'package:flutter/material.dart';

import 'colors_data.dart';
import 'const/sized_blur_spread_radius.dart';
import 'const/sized_font.dart';
import 'const/sized_font_weight.dart';
import 'const/sized_heading_text.dart';
import 'const/sized_letter_spacing.dart';

abstract class StyleCustom {
  static const cardBlurShadow = BoxShadow(
    blurRadius: 40,
    spreadRadius: 0,
    offset: Offset(0, 8),
    color: ColorsCustom.colorBlur,
  );

  static final TextStyle primaryTextStyle = TextStyle(color: Colors.white);

  static final TextStyle fieldTextStyle = TextStyle(
    color: ColorsCustom.textcolorDarkGrey,
    fontSize: SizedFont.textSmallx,
    fontWeight: SizedFontWeight.textLight,
  );
}

abstract class TextStyleHeading {
  const TextStyleHeading();

  static const textH1XXLarge = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textSize_46,
    height: SizedHeightSpacingText.sizedHeightSpacing_68,
  );

  static const textH2XLarge = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textSuperExtraLargexx, //28
    height: SizedHeightSpacingText.sizedHeightSpacing_40,
  );

  static const textH3Large = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textSuperSuperLargex, //24
    height: SizedHeightSpacingText.sizedHeightSpacing_29,
  );

  static const textH4Default = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textSuperLargexx, //22
    height: SizedHeightSpacingText.sizedHeightSpacing_32,
  );

  static const textH5Small = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textLargex, //18
    height: SizedHeightSpacingText.sizedHeightSpacing_24,
  );

  static const textH6XSmall = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textMediumxx, //16
    height: SizedHeightSpacingText.sizedHeightSpacing_22,
  );

  static const textH7XXSmall = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textMedium, //14
    height: SizedHeightSpacingText.sizedHeightSpacing_22,
  );

  static const textH8SuperSmall = TextStyle(
    fontWeight: SizedFontWeight.textNormal,
    fontSize: SizedFont.textSmallx, //12
    height: SizedHeightSpacingText.sizedHeightSpacing_14,
  );
}

abstract class TextStyleCaps {
  const TextStyleCaps();

  static final textCapsXSmall = TextStyle(
    fontSize: SizedFont.textSmallx,
    height: SizedHeightSpacingText.sizedHeightSpacing_16,
    letterSpacing: SizedLetterSpacing.letterSpacing_5,
  );

  static final textCapsSmall = TextStyle(
    fontSize: SizedFont.textMedium,
    height: SizedHeightSpacingText.sizedHeightSpacing_16,
    letterSpacing: SizedLetterSpacing.letterSpacing_5,
  );

  static final textCapsDefault = TextStyle(
    fontSize: SizedFont.textMediumxx,
    height: SizedHeightSpacingText.sizedHeightSpacing_20,
    letterSpacing: SizedLetterSpacing.letterSpacing_5,
  );
}

abstract class TextStyleCustom {
  const TextStyleCustom();

  static final textXSmall = TextStyle(
    fontSize: SizedFont.textSuperSmallxx,
    height: SizedHeightSpacingText.sizedHeightSpacing_14,
  );

  static final textSmall = TextStyle(
    fontSize: SizedFont.textSmallx,
    height: SizedHeightSpacingText.sizedHeightSpacing_14,
  );

  static final textDefault = TextStyle(
    fontSize: SizedFont.textMedium,
    height: SizedHeightSpacingText.sizedHeightSpacing_16,
  );

  static final textLarge = TextStyle(
    fontSize: SizedFont.textMediumxx,
    height: SizedHeightSpacingText.sizedHeightSpacing_20,
  );

  static final textXLarge = TextStyle(
    fontSize: SizedFont.textLargex,
    height: SizedHeightSpacingText.sizedHeightSpacing_24,
  );
}

abstract class TextStyleParagraph {
  const TextStyleParagraph();

  static final textParagraphXSmall = TextStyle(
    fontSize: SizedFont.textSuperSmallxx,
    height: SizedHeightSpacingText.sizedHeightSpacing_16,
  );

  static final textParagraphSmall = TextStyle(
    fontSize: SizedFont.textSmallx,
    height: SizedHeightSpacingText.sizedHeightSpacing_16,
  );

  static final textParagraphDefault = TextStyle(
    fontSize: SizedFont.textMedium,
    height: SizedHeightSpacingText.sizedHeightSpacing_24,
  );

  static final textParagraphLarge = TextStyle(
    fontSize: SizedFont.textMediumxx,
    height: SizedHeightSpacingText.sizedHeightSpacing_24,
  );

  static final textParagraphXLarge = TextStyle(
      fontSize: SizedFont.textLargex,
      height: SizedHeightSpacingText.sizedHeightSpacing_28);
}

abstract class ShadowStyle {
  const ShadowStyle();

  static const List<BoxShadow> shadow4XLarge = [
    const BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur28,
      spreadRadius: SizedBlurSpreadRadius.spreadMines6,
      offset: Offset(0, 6),
      color: ColorsCustom.shadowColor_12,
    ),
    const BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur88,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 18),
      color: ColorsCustom.shadowColor_14,
    ),
  ];

  static const List<BoxShadow> shadow3XLarge = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur22,
      spreadRadius: SizedBlurSpreadRadius.spreadMines6,
      offset: Offset(0, 8),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur64,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 14),
      color: ColorsCustom.shadowColor_12,
    ),
  ];

  static const List<BoxShadow> shadow2XLarge = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur18,
      spreadRadius: SizedBlurSpreadRadius.spreadMines6,
      offset: Offset(0, 8),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur42,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 12),
      color: ColorsCustom.shadowColor_12,
    ),
  ];

  static const List<BoxShadow> shadowXLarge = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur14,
      spreadRadius: SizedBlurSpreadRadius.spreadMines6,
      offset: Offset(0, 6),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur32,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 10),
      color: ColorsCustom.shadowColor_10,
    ),
  ];

  static const List<BoxShadow> shadowLarge = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur12,
      spreadRadius: SizedBlurSpreadRadius.spreadMines6,
      offset: Offset(0, 6),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur24,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 8),
      color: ColorsCustom.shadowColor_8,
    ),
  ];

  static const List<BoxShadow> shadowMedium = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur6,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 4),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur8,
      spreadRadius: SizedBlurSpreadRadius.spreadMines4,
      offset: Offset(0, 8),
      color: ColorsCustom.shadowColor_8,
    ),
  ];

  static const List<BoxShadow> shadowBase10 = [
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur4,
      spreadRadius: SizedBlurSpreadRadius.spreadMines2,
      offset: Offset(0, 2),
      color: ColorsCustom.shadowColor_12,
    ),
    BoxShadow(
      blurRadius: SizedBlurSpreadRadius.blur4,
      spreadRadius: SizedBlurSpreadRadius.spreadMines2,
      offset: Offset(0, 4),
      color: ColorsCustom.shadowColor_8,
    ),
  ];
}
