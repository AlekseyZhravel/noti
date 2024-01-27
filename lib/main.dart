// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/routes.dart';
import 'package:test_project/screens/home/home_screen.dart';
import 'package:test_project/service/push_service.dart';
import 'package:test_project/service/storage_service.dart';

Future<void> initServices() async {
  await Get.putAsync<StorageService>(
      () async => await StorageService().create());
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(MyApp());
  await Get.putAsync<PushService>(() async => await PushService().init());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      title: 'Noti',
      themeMode: ThemeMode.dark,
      initialRoute: HomeScreen.routeName,
      getPages: AppScreen.routes,
      useInheritedMediaQuery: true,
    );
  }
}
