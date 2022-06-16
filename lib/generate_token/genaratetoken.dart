import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supportapp/Modal/modal_datas.dart';
import 'package:supportapp/common_widgets/common_appbar.dart';
import 'package:supportapp/common_widgets/common_selectformfield.dart';
import 'package:supportapp/common_widgets/common_textformfield.dart';

class GenerateToken extends StatefulWidget {
  const GenerateToken({Key? key}) : super(key: key);

  @override
  State<GenerateToken> createState() => _GenerateTokenState();
}

class _GenerateTokenState extends State<GenerateToken> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController doctorController = TextEditingController();

  List<Map<String, dynamic>> doctorData = [
    {"value": "1", "label": "Hari"},
    {"value": "2", "label": "Perasana"}
  ];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        child: CommonAppBar(
          text: "Generate Token",
          leadinWant: false,
        ),
        preferredSize: Size.fromHeight(h * 0.08),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.05,
            ),
            CommonTextFormField(
              height: h * 0.06,
              width: w * 0.9,
              controller: nameController,
              hintText: "Name",
            ),
            SizedBox(
              height: h * 0.05,
            ),
            CommonTextFormField(
              height: h * 0.06,
              width: w * 0.9,
              controller: phoneNumberController,
              hintText: "Phone",
            ),
            SizedBox(
              height: h * 0.05,
            ),
            CommonTextFormField(
              height: h * 0.06,
              width: w * 0.9,
              controller: ageController,
              hintText: "Age",
            ),
            SizedBox(
              height: h * 0.05,
            ),
            CommonSelectForm(
              list: doctorData,
              height: h * 0.06,
              width: w * 0.9,
              textEditingController: doctorController,
            ),
            SizedBox(
              height: h * 0.05,
            ),
            IconButton(
                onPressed: () {
                  generateTokenPost();
                },
                icon: Icon(Icons.generating_tokens))
          ],
        ),
      ),
    );
  }
  // post({name}) async {
  //   final posting = FirebaseFirestore.instance.collection('users').doc();
  //   final user = UserModal(
  //       id: posting.id,
  //       userName: name,
  //       age: 21,
  //       dob: DateFormat("dd-MM-yyyy").format(DateTime.now()));
  //   final json = user.toJosn();
  //
  //   await posting.set(json);
  // }

  generateTokenPost() async {
    final posting = FirebaseFirestore.instance.collection('users').doc();
    final token = UserModal(
        id: posting.id,
        date: DateFormat("dd-MM-yyyy").format(DateTime.now()),
        doctorId: "1",
        status: "open",
        phone: phoneNumberController.text.toString(),
        name: nameController.text.toString(),
        age: ageController.text.toString());

    final json = token.toJson();
    await posting.set(json);
  }
}
