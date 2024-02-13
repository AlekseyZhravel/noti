// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_project/shared_widgets/custom_button.dart';
import 'package:test_project/shared_widgets/notification_card.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/home/home_controller.dart';
import 'package:test_project/screens/select_trigger/select_trigger_screen.dart';

class HomeBody extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        id: 'noti_list',
        builder: (_) {
          return !controller.isOneTimeListShow
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      controller.minutesList.length,
                      (index) => GestureDetector(
                            onTap: () {
                              Get.toNamed('/recurring_noti_list', arguments: {
                                'type':
                                    '${controller.minutesList[index]}_minute',
                                'title':
                                    '${controller.minutesList[index]} Minute',
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: kCardColor,
                                border: Border(
                                  bottom: BorderSide(
                                    color: kDividerColor1,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              height: 56,
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text(
                                    '${controller.minutesList[index]} Minute',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  const Spacer(),
                                  const RotatedBox(
                                    quarterTurns: 2,
                                    child: Icon(
                                      CupertinoIcons.back,
                                      color: kVioletColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                )
              : SingleChildScrollView(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.tempNotiList.length + 1,
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ),
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: index == controller.tempNotiList.length - 1
                            ? 24
                            : 16.0,
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
                              controller.deleteCard(index);
                            },
                            selectTriggerOne: () {
                              Get.toNamed(SelectTrigger.routeName,
                                  arguments: 1);
                            },
                            selectTriggerTwo: () {
                              Get.toNamed(SelectTrigger.routeName,
                                  arguments: 2);
                            },
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 24),
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
