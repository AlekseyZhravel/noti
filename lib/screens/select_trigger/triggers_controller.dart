import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/select_trigger/select_trigger_model.dart';
import 'package:test_project/service/storage_service.dart';

class TriggersController extends GetxController {
  final StorageService storageService = Get.find();
  final ScrollController scrollController = ScrollController();
  late List<SelectTriggerModel> list;
  late int listInt;
  late double pixels;
  late double maxScrollExtent;
  bool shadowIsVisible = false;
  bool isHasListener = false;

  @override
  void onInit() {
    list = Get.arguments == 1
        ? storageService.savedTriggerList1
        : storageService.savedTriggerList2;
    listInt = Get.arguments;
    initListener();
    super.onInit();
  }

  void checkPosition() {
    if (isHasListener) {
      pixels = scrollController.position.pixels;
      maxScrollExtent = scrollController.position.maxScrollExtent;
      if (pixels != maxScrollExtent) {
        if (!shadowIsVisible) {
          shadowIsVisible = true;
        }
        if (maxScrollExtent < 30) {
          shadowIsVisible = false;
        }
      } else {
        if (shadowIsVisible) {
          shadowIsVisible = false;
        }
      }
      update(['bottom_bar']);
    }
  }

  void initListener() {
    scrollController.addListener(() {
      isHasListener = scrollController.hasClients;
      pixels = scrollController.position.pixels;
      maxScrollExtent = scrollController.position.maxScrollExtent;

      if (scrollController.position.pixels !=
          scrollController.position.maxScrollExtent) {
        if (!shadowIsVisible) {
          shadowIsVisible = true;
        }
      } else {
        if (shadowIsVisible) {
          shadowIsVisible = false;
        }
      }
      update(['bottom_bar']);
    });
  }

  void saveList() {
    if (listInt == 1) {
      storageService.savedTriggerList1 = list;
    } else {
      storageService.savedTriggerList2 = list;
    }
    storageService.dataSave();
    Get.back();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
