// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_project/components/custom_button.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/login/login_controller.dart';

class LoginBody extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 72.0,
        ),
        const Text(
          'Log In',
          style: TextStyle(
            color: kAppBarColor,
            fontSize: 24,
            height: 1.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        const Text(
          'Enter current time in hh : mm format',
          style: TextStyle(
            color: Color(0xFF747377),
            fontSize: 16,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 42.0,
        ),
        GetBuilder<LoginController>(
          id: 'time',
          builder: (_) {
            return Text(
              controller.currentTime,
              style: const TextStyle(
                color: kAppBarColor,
                fontSize: 32,
                height: 1.5,
                fontWeight: FontWeight.w700,
              ),
            );
          },
        ),
        const SizedBox(
          height: 42.0,
        ),
        Row(
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
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorWidth: 2,
                    cursorHeight: 26,
                    cursorRadius: const Radius.circular(2),
                    cursorColor: kAppBarColor,
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(
                          left: controller.focusNodes[index].hasFocus ? 1 : 3),
                      fillColor: Colors.white,
                      enabledBorder: kLogInOtpBorder,
                      errorBorder: kLogInOtpBorder,
                      focusedBorder: kLogInOtpBorderFocus,
                      focusedErrorBorder: kLogInOtpBorder,
                    ),
                    onTapOutside: (tap) {
                      FocusScope.of(context).unfocus();
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
        const Spacer(),
        GetBuilder<LoginController>(
          id: 'button',
          builder: (_) {
            return SafeArea(
              child: Column(
                children: [
                  Visibility(
                    visible: !controller.otpValidate &&
                        controller.otp.last.isNotEmpty,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      width: Get.width,
                      color: kDividerColor2,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/error_icon.svg',
                            color: kRedColor,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            'The time is wrong. Try again.',
                            style: TextStyle(
                              color: kRedColor,
                              fontSize: 14,
                              height: 1.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      text: 'Confirm',
                      onPressed: () {
                        controller.login();
                      },
                      isActive: controller.otpValidate,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
