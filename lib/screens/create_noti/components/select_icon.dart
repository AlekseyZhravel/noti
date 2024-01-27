// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/create_noti/create_noti_controller.dart';

class SelectIcon extends GetView<CreateNotiController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 10,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Icon style',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: kAppBarColor,
                    height: 1.5,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: SvgPicture.asset('assets/icons/exit_color_icon.svg'),
                  onPressed: () => Get.back(),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
            child: Divider(
              height: 0,
              color: kDividerColor2,
              thickness: 1,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Background colors',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF747377),
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          GetBuilder<CreateNotiController>(
              id: 'select_icon_color',
              builder: (_) {
                return SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        kColorList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            controller.selectedColor = index;
                            controller.update(['select_icon_color']);
                          },
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: index == controller.selectedColor
                                        ? const Color(0xff6A4DBA)
                                        : Colors.transparent,
                                    width: 3),
                                shape: BoxShape.circle,
                                color: Colors.transparent),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: kDividerColor1, width: 1),
                                  shape: BoxShape.circle,
                                  color: Color(kColorList[index])),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Select icons',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF747377),
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          GetBuilder<CreateNotiController>(
              id: 'select_icon',
              builder: (_) {
                return SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          kIconsList.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  controller.selectedIcon = index + 1;
                                  controller.update(['select_icon']);
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: index + 1 ==
                                                  controller.selectedIcon
                                              ? const Color(0xff6A4DBA)
                                              : Colors.transparent,
                                          width: 3),
                                      shape: BoxShape.circle,
                                      color: Colors.transparent),
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(13),
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kDividerColor1, width: 1),
                                        shape: BoxShape.circle,
                                        color: Colors.transparent),
                                    child: SvgPicture.asset(
                                      'assets/icons/selected_icon_${index + 1}.svg',
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                );
              }),
          Container(
            constraints: const BoxConstraints(maxHeight: 78, minHeight: 34),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: 'Save changes',
              onPressed: () {
                controller.update(['result_icon']);
                Get.back();
              },
            ),
          ),
          const SizedBox(
            height: 34.0,
          ),
        ],
      ),
    );
  }
}
