// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/models/notification_model.dart';

class NotificationCard extends StatelessWidget {
  late NotificationData notification;
  late Function() delete;
  late Function() selectTriggerOne;
  late Function() selectTriggerTwo;

  NotificationCard({
    required this.notification,
    required this.delete,
    required this.selectTriggerOne,
    required this.selectTriggerTwo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.only(
          top: 14.0, left: 16.0, right: 16.0, bottom: 16.0),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: kVioletColor, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          notification.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF747377)),
                          shape: BoxShape.circle,
                          color: notification.backgroundColor != null
                              ? Color(notification.backgroundColor!)
                              : Colors.transparent,
                        ),
                        child: SvgPicture.asset(
                            'assets/icons/${notification.icon!}'),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: delete,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child:
                              SvgPicture.asset('assets/icons/delete_icon.svg'),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Row(
            children: [
              const Text(
                'Time:',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF747377),
                  height: 1.5,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Text(
                DateFormat.Hm().format(notification.time),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w700,
                  color: kAppBarColor,
                  height: 1.5,
                ),
              ),
              const Spacer(),
              Visibility(
                visible: notification.icon == null,
                child: InkWell(
                  onTap: delete,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: SvgPicture.asset('assets/icons/delete_icon.svg'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                const Text(
                  'Message:',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF747377),
                    height: 1.5,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Flexible(
                  child: Text(
                    notification.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                      color: kAppBarColor,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: selectTriggerOne,
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: kVioletColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Select trigger 1',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: kVioletColor,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: selectTriggerTwo,
                  child: Container(
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: kVioletColor,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Select trigger 2',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: kVioletColor,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
