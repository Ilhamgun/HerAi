import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:herai/app/resource/colors_data.dart';
import 'package:herai/app/resource/styles.dart';

class DropdownCustom<T> extends StatelessWidget {
  const DropdownCustom(
      {Key? key,
      this.selectedValue,
      this.onChanged,
      required this.label,
      required this.hint,
      this.onMenuStateChange,
      this.isImportant = false,
      this.itemHeight,
      this.buttonHeight,
      this.listItems,
      this.noTitle = false})
      : super(key: key);

  final T? selectedValue;
  final Function(T?)? onChanged;
  final bool noTitle;
  final String label;
  final String hint;
  final Function(bool)? onMenuStateChange;
  final bool isImportant;
  final double? itemHeight;
  final double? buttonHeight;
  final List<DropdownMenuItem<T>>? listItems;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!noTitle)
          Row(
            children: [
              Text(
                label,
              ),
            ],
          ),
        SizedBox(height: 8),
        Container(
          height: 44,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: [
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      hint,
                      style: TextStyleCustom.textDefault,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: listItems,
              value: selectedValue,
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: ColorsCustom.primaryColor.green,
              ),
              iconSize: 22,
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
              buttonHeight: buttonHeight ?? 50,
              buttonWidth: width - 100,
              buttonPadding: const EdgeInsets.only(left: 14, right: 14),
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black26),
                color: Colors.white,
              ),
              buttonElevation: 0,
              itemHeight: itemHeight ?? 40,
              itemPadding: const EdgeInsets.only(left: 14, right: 14),
              dropdownMaxHeight: width - 100,
              dropdownWidth: width - 100,
              dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                  border: Border.all(
                      color: ColorsCustom.othersColor.darkGrey10, width: 0.4)),
              dropdownElevation: 0,
              scrollbarRadius: const Radius.circular(40),
              scrollbarThickness: 1,
              scrollbarAlwaysShow: true,
              onMenuStateChange: onMenuStateChange,
            ),
          ),
        )
      ],
    );
  }
}
