import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/screens/home/home_screen.dart';
import 'package:test_project/service/storage_service.dart';
import 'package:uuid/uuid.dart';

class LoginController extends GetxController {
  final StorageService storageService = Get.find();
  final List<TextEditingController> textEditingControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final List<String> otp = List.filled(4, '');
  bool otpValidate = true;
  String currentTime = '';

  @override
  void onInit() {
    super.onInit();
    setTime();
  }

  void setTime() {
    currentTime = getCurrentTime;
    setOtpValidate();
    update(['time', 'button']);
    Future.delayed(const Duration(seconds: 1), setTime);
  }

  String get getCurrentTime {
    final DateTime now = DateTime.now();
    return DateFormat.Hm().format(now);
  }

  void otpLogic(BuildContext context, int index, String value) {
    otp[index] = value;
    if (value.isNotEmpty) {
      if (index < textEditingControllers.length - 1) {
        FocusScope.of(context).nextFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
  }

  void setOtpValidate() {
    if (getCurrentTime == '${otp[0]}${otp[1]}:${otp[2]}${otp[3]}') {
      otpValidate = true;
    } else {
      otpValidate = false;
    }
  }

  void login() {
    if (otpValidate) {
      if (storageService.authToken.isEmpty) {
        var uuid = const Uuid();
        storageService.authToken = uuid.v4();
        storageService.dataSave();
        Get.offAllNamed(HomeScreen.routeName);
      }
    }
  }

  @override
  void dispose() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }
}
