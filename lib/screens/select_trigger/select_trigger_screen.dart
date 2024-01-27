// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/select_trigger/components/select_trigger_body.dart';
import 'package:test_project/screens/select_trigger/triggers_controller.dart';

class SelectTrigger extends GetView<TriggersController> {
  static const String routeName = '/select_trigger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: GetBuilder<TriggersController>(
            id: 'bottom_bar',
            builder: (_) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: !controller.shadowIsVisible
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 10,
                            blurRadius: 20,
                            offset: const Offset(0, 3),
                          ),
                        ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16, top: 16, bottom: 34),
                    child: CustomButton(
                      text: 'Save',
                      onPressed: () {
                        controller.saveList();
                      },
                    ),
                  ),
                ),
              );
            }),
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          backgroundColor: kAppBarColor,
          shadowColor: Colors.black.withOpacity(0.3),
          title: Text(
            'Select Trigger ${Get.arguments}',
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
        body: SelectTriggerBody());
  }
}
