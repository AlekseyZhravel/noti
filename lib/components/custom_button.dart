import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final String buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isActive = true,
    this.buttonType = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: Get.width,
        height: buttonType == 'add' ? 48 : 56,
        decoration: BoxDecoration(
          color: isActive ? kVioletColor : kGrayColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonType == 'add'
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        'assets/icons/add_icon.svg',
                        width: 20,
                      ),
                    )
                  : const SizedBox(),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
