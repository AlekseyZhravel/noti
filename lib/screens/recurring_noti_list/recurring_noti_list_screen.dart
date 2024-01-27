// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/recurring_noti_list/components/recurring_noti_list_body.dart';

class RecurringNotiScreen extends StatelessWidget {
  static const String routeName = '/recurring_noti_list';
  String title = Get.arguments['title'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kBackgroundColor,
      extendBody: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: kAppBarColor,
        shadowColor: Colors.black.withOpacity(0.3),
        title: Text(
          title,
          style: kAppBarTextStyle,
        ),
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: RecurringNotiBody()),
        ],
      ),
    );
  }
}
