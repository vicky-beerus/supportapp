import 'package:flutter/material.dart';

class CommonCircularAvatar extends StatefulWidget {
  Widget? content;
  Color? backgroundColor;

  CommonCircularAvatar({this.content, this.backgroundColor});
  @override
  State<CommonCircularAvatar> createState() => _CommonCircularAvatarState();
}

class _CommonCircularAvatarState extends State<CommonCircularAvatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: widget.content,
      backgroundColor:
          widget.backgroundColor == null ? Colors.teal : widget.backgroundColor,
    );
  }
}
