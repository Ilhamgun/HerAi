import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RenderSvgFile extends StatelessWidget {
  final String pathImage;
  final double? width;
  final double? height;
  final Color? colorAsset;
  final BoxFit fitImage;
  const RenderSvgFile({
    Key? key,
    this.pathImage = '',
    this.width,
    this.height,
    this.colorAsset,
    this.fitImage = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        pathImage,
        color: colorAsset,
        height: height,
        width: width,
        fit: fitImage,
      ),
    );
  }
}
