import 'package:flutter/material.dart';

class CommonText extends StatefulWidget {
  String? text;
  double? textSize;
  Color? textColor;
  FontWeight? textWeight;
  CommonText({this.text, this.textColor, this.textSize, this.textWeight});

  @override
  State<CommonText> createState() => _CommonTextState();
}

class _CommonTextState extends State<CommonText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.text}",
      style: TextStyle(
          fontSize: widget.textSize == null ? 12 : widget.textSize,
          color: widget.textColor,
          fontWeight: widget.textWeight),
    );
  }
}
