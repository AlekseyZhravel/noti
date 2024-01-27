// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/create_noti/components/select_icon.dart';
import 'package:test_project/screens/create_noti/create_noti_controller.dart';

class CreateNotiBody extends GetView<CreateNotiController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 26.0,
          ),
          const Text(
            'Message',
            style: TextStyle(
              color: kAppBarColor,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          TextFormField(
            focusNode: controller.massageFocusNode,
            textCapitalization: TextCapitalization.words,
            controller: controller.massageTextController,
            minLines: 4,
            maxLines: 4,
            style: const TextStyle(
              color: kAppBarColor,
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
            cursorWidth: 2,
            cursorHeight: 26,
            cursorRadius: const Radius.circular(2),
            cursorColor: kAppBarColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: "Enter text",
              hintStyle: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, color: kGrayColor),
              fillColor: Colors.white,
              filled: true,
              enabledBorder: kLogInOtpBorder,
              errorBorder: kLogInOtpBorder,
              focusedBorder: kLogInOtpBorderFocus,
              focusedErrorBorder: kLogInOtpBorder,
            ),
            onChanged: (value) {
              controller.setFieldValidate();
              controller.update(['time_builder']);
            },
            onTapOutside: (tap) {
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          Visibility(
            visible: controller.type == 'one_time',
            child: const Text(
              'Type time',
              style: TextStyle(
                color: kAppBarColor,
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Visibility(
            visible: controller.type == 'one_time',
            child: const SizedBox(
              height: 6.0,
            ),
          ),
          Visibility(
            visible: controller.type == 'one_time',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                controller.textEditingControllers.length,
                (index) => Row(
                  children: [
                    Container(
                      width: 44,
                      height: 48.0,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: TextFormField(
                        controller: controller.textEditingControllers[index],
                        focusNode: controller.focusNodes[index],
                        scrollPadding: EdgeInsets.zero,
                        maxLength: 1,
                        style: const TextStyle(
                          color: kAppBarColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        cursorWidth: 2,
                        cursorHeight: 26,
                        cursorRadius: const Radius.circular(2),
                        cursorColor: kAppBarColor,
                        decoration: InputDecoration(
                          counterText: '',
                          contentPadding: EdgeInsets.only(
                              left: controller.focusNodes[index].hasFocus
                                  ? 1
                                  : 3),
                          fillColor: Colors.white,
                          enabledBorder: kLogInOtpBorder,
                          errorBorder: kLogInOtpBorder,
                          focusedBorder: kLogInOtpBorderFocus,
                          focusedErrorBorder: kLogInOtpBorder,
                        ),
                        onTapOutside: (tap) {
                          FocusScope.of(context).unfocus();
                          controller.setFieldValidate();
                        },
                        onChanged: (value) {
                          controller.otpLogic(context, index, value);
                        },
                      ),
                    ),
                    index == 1
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              ':',
                              style: TextStyle(
                                color: kGrayColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 32.0,
                                // height: 1.5,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: controller.type == 'one_time',
            child: const SizedBox(
              height: 24.0,
            ),
          ),
          const Text(
            'Icon',
            style: TextStyle(
              color: kAppBarColor,
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Row(
            children: [
              GetBuilder<CreateNotiController>(
                  id: 'result_icon',
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();

                        Get.bottomSheet(
                          barrierColor: Colors.transparent,
                          SelectIcon(),
                          isScrollControlled: true,
                        );
                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: kGrayColor),
                            shape: BoxShape.circle,
                            color: controller.selectedColor == null
                                ? Colors.transparent
                                : Color(kColorList[controller.selectedColor!])),
                        child: SvgPicture.asset(
                          controller.selectedIcon == null
                              ? 'assets/icons/default_icon.svg'
                              : 'assets/icons/selected_icon_${controller.selectedIcon}.svg',
                          width: 27,
                        ),
                      ),
                    );
                  }),
              const SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  Get.bottomSheet(
                    barrierColor: Colors.transparent,
                    SelectIcon(),
                    isScrollControlled: true,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF6A4DBA),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 43, vertical: 10),
                      child: Text(
                        'Select icon',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF6A4DBA),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          GetBuilder<CreateNotiController>(
            id: 'button',
            builder: (logic) {
              return SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 32.0,
                    ),
                    CustomButton(
                      text: 'Confirm',
                      isActive: controller.otpValidate,
                      onPressed: () {
                        if (controller.otpValidate) {
                          controller.notiCardData != null
                              ? controller.editNotification()
                              : controller.addNotification();
                        } else {
                          controller.nextRequiredField();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 34.0,
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
