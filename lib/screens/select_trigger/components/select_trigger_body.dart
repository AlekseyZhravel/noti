// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/select_trigger/components/trigger_list.dart';
import 'package:test_project/screens/select_trigger/triggers_controller.dart';

class SelectTriggerBody extends GetView<TriggersController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        controller: controller.scrollController,
        child: TriggerList(
          list: controller.list,
          level: 1,
        ),
      ),
    );
  }
}
