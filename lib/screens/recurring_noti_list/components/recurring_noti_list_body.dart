// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/components/notification_card.dart';
import 'package:test_project/screens/recurring_noti_list/recurring_noti_list_controller.dart';
import 'package:test_project/screens/select_trigger/select_trigger_screen.dart';

class RecurringNotiBody extends GetView<RecurringNotiController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecurringNotiController>(
        id: 'recurring_noti_list',
        builder: (_) {
          return SingleChildScrollView(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.tempNotiList.length + 1,
              padding: const EdgeInsets.only(top: 16.0),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: index == controller.tempNotiList.length - 1 ? 24 : 16,
                );
              },
              itemBuilder: (context, index) {
                if (index < controller.tempNotiList.length) {
                  return GestureDetector(
                    onTap: () {
                      controller.manageNotiCard(
                          createCard: false, index: index);
                    },
                    child: NotificationCard(
                      notification: controller.tempNotiList[index],
                      delete: () {
                        controller.delete(index);
                      },
                      selectTriggerOne: () {
                        Get.toNamed(SelectTrigger.routeName, arguments: 1);
                      },
                      selectTriggerTwo: () {
                        Get.toNamed(SelectTrigger.routeName, arguments: 2);
                      },
                    ),
                  );
                } else {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    child: CustomButton(
                      text: 'Add new notification',
                      buttonType: 'add',
                      onPressed: () {
                        controller.manageNotiCard(createCard: true);
                      },
                    ),
                  );
                }
              },
            ),
          );
        });
  }
}
