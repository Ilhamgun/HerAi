import 'package:flutter/material.dart';

class TextFormStyleTitleCustom extends StatelessWidget {
  final String? title;
  final String? errorText;
  final TextStyle titleStyle;
  final IconData? iconPrefix;
  final Widget? iconSuffix;
  final String hintText;
  final int maxLines;
  final int? minLines;
  final Color colorTitle;
  final TextEditingController? formController;
  final Function(String)? onChange;
  final String? Function(String?)? validatorForm;
  final bool obsecureText;
  final GestureTapCallback? onTap;
  final TextInputType textInputType;

  const TextFormStyleTitleCustom({
    Key? key,
    this.title,
    this.errorText,
    required this.titleStyle,
    this.iconPrefix,
    this.iconSuffix,
    required this.hintText,
    this.maxLines = 1,
    this.minLines,
    this.colorTitle = Colors.grey,
    this.formController,
    this.onChange,
    this.validatorForm,
    this.obsecureText = false,
    this.onTap,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null
              ? Container()
              : Text(
                  title!,
                  style: titleStyle,
                ),
          const SizedBox(height: 20),
          TextFormField(
            onChanged: onChange,
            maxLines: maxLines,
            minLines: minLines,
            onTap: onTap,
            controller: formController,
            cursorColor: Colors.green,
            validator: validatorForm,
            obscureText: obsecureText,
            keyboardType: textInputType,
            decoration: InputDecoration(
              errorText: errorText,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              filled: true,
              focusColor: Colors.white,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 24,
              ),
              hintStyle: TextStyle(fontSize: 12),
              suffixIcon: iconSuffix,
              prefixIcon: (iconPrefix == null)
                  ? null
                  : Icon(
                      iconPrefix,
                      size: 20,
                      color: Colors.grey[500],
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(color: Colors.green.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  color: Colors.green.shade300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
