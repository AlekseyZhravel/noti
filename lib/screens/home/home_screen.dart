// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/home/components/home_body.dart';
import 'package:test_project/screens/home/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        backgroundColor: kAppBarColor,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          'Notifications',
          style: kAppBarTextStyle,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<HomeController>(
              id: 'list_noti_switch',
              builder: (_) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, bottom: 16, top: 10),
                  decoration: const BoxDecoration(
                    color: kAppBarColor,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    height: 48,
                    decoration: BoxDecoration(
                        color: kDividerColor2,
                        border: Border.all(color: kDividerColor1, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.isOneTimeListShow = true;
                              controller
                                  .update(['list_noti_switch', 'noti_list']);
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: !controller.isOneTimeListShow
                                      ? []
                                      : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                  color: controller.isOneTimeListShow
                                      ? kVioletColor
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/one_time_icon.svg',
                                      color: controller.isOneTimeListShow
                                          ? Colors.white
                                          : kAppBarColor,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'One-time',
                                      style: TextStyle(
                                          fontWeight:
                                              controller.isOneTimeListShow
                                                  ? FontWeight.w700
                                                  : FontWeight.w500,
                                          fontSize: 16.0,
                                          color: controller.isOneTimeListShow
                                              ? Colors.white
                                              : kAppBarColor,
                                          height: 1.5),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.isOneTimeListShow = false;
                              controller
                                  .update(['list_noti_switch', 'noti_list']);
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  boxShadow: controller.isOneTimeListShow
                                      ? []
                                      : [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            spreadRadius: 2,
                                            blurRadius: 4,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                  color: !controller.isOneTimeListShow
                                      ? kVioletColor
                                      : Colors.transparent,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(6))),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/recurring_icon.svg',
                                      color: !controller.isOneTimeListShow
                                          ? Colors.white
                                          : kAppBarColor,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Recurring',
                                      style: TextStyle(
                                          fontWeight:
                                              !controller.isOneTimeListShow
                                                  ? FontWeight.w700
                                                  : FontWeight.w500,
                                          fontSize: 16.0,
                                          color: !controller.isOneTimeListShow
                                              ? Colors.white
                                              : kAppBarColor,
                                          height: 1.5),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Expanded(child: HomeBody()),
        ],
      ),
    );
  }
}
