import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class CommonSelectForm extends StatefulWidget {
  double? height;
  double? width;
  String? hintText;
  TextEditingController? textEditingController;
  List<Map<String, dynamic>> list;

  CommonSelectForm(
      {this.height,
      this.width,
      this.hintText,
      this.textEditingController,
      required this.list});

  @override
  State<CommonSelectForm> createState() => _CommonSelectFormState();
}

class _CommonSelectFormState extends State<CommonSelectForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(10)),
      child: SelectFormField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.blueGrey,
              size: 25,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(10)),
        hintText: widget.hintText,
        controller: widget.textEditingController,
        items: widget.list,
        onChanged: (val) {},
      ),
    );
  }
}
