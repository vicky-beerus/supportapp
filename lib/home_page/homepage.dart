import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supportapp/common_widgets/common_appbar.dart';
import 'package:supportapp/home_page/tab_page/complete_list.dart';
import 'package:supportapp/home_page/tab_page/missed_list.dart';
import 'package:supportapp/home_page/tab_page/open_list.dart';

import '../service/common_function.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var datas;

  @override
  void initState() {
    Provider.of<CommonFunction>(context, listen: false).genarateList();
    // Provider.of<CommonFunction>(context, listen: false).geetingUserData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: PreferredSize(
          child: CommonAppBar(
            text: "Support App",
            leadinWant: false,
          ),
          preferredSize: Size.fromHeight(h * 0.08),
        ),
        body: Container(
            height: h * 0.75,
            width: w,
            child: TabBarView(
                children: [MissedList(), OpenList(), CompleteList()])),
        bottomSheet: Container(
          height: h * 0.08,
          width: w,
          color: Colors.red,
          child: Center(
            child: Container(
              height: h * 0.06,
              width: w * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                  labelStyle: const TextStyle(
                      fontStyle: FontStyle.italic, fontSize: 18),
                  unselectedLabelStyle: const TextStyle(
                      fontStyle: FontStyle.normal, fontSize: 15),
                  indicatorColor: Colors.blueGrey,
                  indicator: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(30)),
                  labelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: "Missed",
                    ),
                    Tab(
                      text: "Open",
                    ),
                    Tab(
                      text: "complete",
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
