// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/create_noti/components/create_noti_body.dart';

class CreateNotiScreen extends StatelessWidget {
  static const String routeName = '/create_noti';
  final bool isNew = Get.arguments['isNewCard'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        shadowColor: Colors.black.withOpacity(0.3),
        title: Text(
          isNew ? 'Add new notification' : 'Edit notification',
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
      body: CreateNotiBody(),
    );
  }
}
