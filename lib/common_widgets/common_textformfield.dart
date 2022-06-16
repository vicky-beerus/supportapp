import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  double? height;
  double? width;
  String? hintText;
  TextEditingController? controller;
  CommonTextFormField(
      {this.width, this.height, this.hintText, this.controller});

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}
