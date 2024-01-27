import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/login/login_screen.dart';
import 'package:test_project/service/storage_service.dart';

class IfNoAuth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    StorageService storageService = Get.find();
    if (storageService.authToken.isEmpty) {
      return const RouteSettings(name: LoginScreen.routeName);
    }
    return null;
  }
}
