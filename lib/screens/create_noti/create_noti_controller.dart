import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/models/notification_model.dart';
import 'package:test_project/service/storage_service.dart';
import 'package:uuid/uuid.dart';

class CreateNotiController extends GetxController {
  final StorageService storageService = Get.find();
  final TextEditingController massageTextController = TextEditingController();
  final List<TextEditingController> textEditingControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());
  final FocusNode massageFocusNode = FocusNode();
  NotificationData? notiCardData = Get.arguments['noti_card_data'];
  List<String> otp = List.filled(4, '');
  String type = Get.arguments['type'];
  int? selectedColor;
  int? selectedIcon;
  bool otpValidate = false;

  @override
  onInit() {
    super.onInit();
    fillingCard();
    setFieldValidate();
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
    setFieldValidate();
    update(['button']);
  }

  void fillingCard() {
    if (notiCardData != null) {
      String dateTime = DateFormat.Hm().format(notiCardData!.time);
      massageTextController.text = notiCardData!.message;
      textEditingControllers[0].text = dateTime[0];
      textEditingControllers[1].text = dateTime[1];
      textEditingControllers[2].text = dateTime[3];
      textEditingControllers[3].text = dateTime[4];
      otp = [
        textEditingControllers[0].text,
        textEditingControllers[1].text,
        textEditingControllers[2].text,
        textEditingControllers[3].text
      ];
      selectedColor = notiCardData!.backgroundColor == null
          ? null
          : kColorList.indexWhere(
              (element) => element == notiCardData!.backgroundColor);
      selectedIcon = notiCardData!.icon == null
          ? null
          : int.parse(notiCardData!.icon!.split('.').first.split('').last);
      update(['result_icon', 'otp', 'button']);
    }
  }

  void editNotification() {
    for (var element in storageService.notificationList.value.list) {
      if (element.id.hashCode == notiCardData!.id.hashCode) {
        element.message = massageTextController.text;
        element.time = getNotiTime;
        element.icon =
            selectedIcon == null ? null : 'selected_icon_${selectedIcon!}.svg';
        element.backgroundColor =
            selectedColor == null ? null : kColorList[selectedColor!];
      }
    }
    storageService.dataSave();
    Get.back();
  }

  void addNotification() {
    var uuid = const Uuid();
    storageService.notificationList.value.list.insert(
      0,
      NotificationData(
          id: uuid.v4(),
          message: massageTextController.text,
          type: Get.arguments['type'],
          time: getNotiTime,
          icon: selectedIcon == null
              ? null
              : 'selected_icon_${selectedIcon!}.svg',
          backgroundColor:
              selectedColor == null ? null : kColorList[selectedColor!]),
    );
    storageService.dataSave();
    storageService.addPush();
    Get.back();
  }

  DateTime get getNotiTime {
    switch (Get.arguments['type']) {
      case 'one_time':
        return DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            int.parse('${otp[0]}${otp[1]}'),
            int.parse('${otp[2]}${otp[3]}'));
      case '1_minute':
        return DateTime.now().add(const Duration(minutes: 1));
      case '3_minute':
        return DateTime.now().add(const Duration(minutes: 3));
      case '5_minute':
        return DateTime.now().add(const Duration(minutes: 5));
    }
    return DateTime.now();
  }

  void nextRequiredField() {
    if (massageTextController.text.isEmpty) {
      massageFocusNode.requestFocus();
    } else if (textEditingControllers[0].text.isEmpty) {
      focusNodes[0].requestFocus();
    } else if (textEditingControllers[1].text.isEmpty) {
      focusNodes[1].requestFocus();
    } else if (textEditingControllers[2].text.isEmpty) {
      focusNodes[2].requestFocus();
    } else if (textEditingControllers[3].text.isEmpty) {
      focusNodes[3].requestFocus();
    }
  }

  void setFieldValidate() {
    if (type == 'one_time') {
      if (massageTextController.text.isNotEmpty &&
          textEditingControllers[0].text.isNotEmpty &&
          textEditingControllers[1].text.isNotEmpty &&
          textEditingControllers[2].text.isNotEmpty &&
          textEditingControllers[3].text.isNotEmpty) {
        otpValidate = true;
      } else {
        otpValidate = false;
      }
    } else {
      if (massageTextController.text.isNotEmpty) {
        otpValidate = true;
      } else {
        otpValidate = false;
      }
    }
    update(['otp_validate_builder', 'button']);
  }
}
