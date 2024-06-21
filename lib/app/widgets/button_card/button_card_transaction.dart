import 'package:flutter/material.dart';
import 'package:herai/app/resource/colors_data.dart';

class ButtonCardTransaction extends StatelessWidget {
  final String iconAssets;
  final String textTodo;
  const ButtonCardTransaction({
    Key? key,
    required this.iconAssets,
    required this.textTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: ColorsCustom.primaryColor.midOrange),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            iconAssets,
            width: 42,
            height: 42,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 120,
            child: Text(
              textTodo,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}
