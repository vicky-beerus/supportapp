import 'package:flutter/material.dart';
import 'package:supportapp/common_widgets/common_text.dart';

class CommonAppBar extends StatefulWidget {
  double? appBarHeight;
  String? text;
  Widget? leading;
  Color? color;
  bool? leadinWant;

  CommonAppBar(
      {this.appBarHeight,
      this.text,
      this.leading,
      this.color,
      this.leadinWant});
  @override
  State<CommonAppBar> createState() => _CommonAppBarState();
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.color == null ? Colors.blueGrey : widget.color,
      leading: widget.leading == null && widget.leadinWant == true
          ? IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ))
          : widget.leading,
      title: CommonText(
        text: widget.text,
        textSize: 20,
      ),
    );
  }
}
