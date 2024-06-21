import 'package:flutter/material.dart';
import 'package:herai/app/resource/colors_data.dart';

class DotIndicatorModel1 extends StatelessWidget {
  final int dataLength;
  final int currentPage;
  const DotIndicatorModel1({
    Key? key,
    this.dataLength = 0,
    this.currentPage = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          dataLength,
          (int index) {
            return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 8,
                width: (index == currentPage) ? 30 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: (index == currentPage)
                        ? PrimaryColor().green
                        : Colors.grey.withOpacity(0.5)));
          },
        ),
      ),
    );
  }
}
