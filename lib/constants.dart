import 'package:flutter/material.dart';

const Color kAppBarColor = Color(0xFF1A1717);
const Color kVioletColor = Color(0xFF6A4DBA);
const Color kRedColor = Color(0xFFF43528);
const Color kGrayColor = Color(0xFFB9B9B9);
const Color kDividerColor1 = Color(0xffE6E6E6);
const Color kDividerColor2 = Color(0xffF3F3F4);
const Color kCardColor = Color(0xffF8FAFB);
const Color kBackgroundColor = Color(0xFFFFFFFF);
OutlineInputBorder kLogInOtpBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kDividerColor1),
  borderRadius: BorderRadius.circular(8),
);
OutlineInputBorder kLogInOtpBorderFocus = OutlineInputBorder(
  borderSide: const BorderSide(color: kVioletColor),
  borderRadius: BorderRadius.circular(8),
);

const TextStyle kAppBarTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    color: kBackgroundColor,
    height: 1.5);

const List<int> kColorList = [
  0xffF1F4FF,
  0xffFFF1F1,
  0xffFFFEF1,
  0xffF5F1FF,
  0xffFFF1FF
];
const List<String> kIconsList = [
  'selected_icon_1.svg',
  'selected_icon_2.svg',
  'selected_icon_3.svg',
  'selected_icon_4.svg',
  'selected_icon_5.svg',
];
