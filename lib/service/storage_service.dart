// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/models/notification_model.dart';
import 'package:test_project/models/push_model.dart';
import 'package:test_project/screens/select_trigger/select_trigger_model.dart';
import 'push_service.dart';

class StorageService extends GetxService {
  late final SharedPreferences prefs;
  String authToken = '';
  Rx<NotificationModel> notificationList = NotificationModel(list: []).obs;
  List<SelectTriggerModel> selectOne = [
    SelectTriggerModel(title: 'All Triggers'),
    SelectTriggerModel(title: 'Sport', child: [
      SelectTriggerModel(
          title:
              'Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
          child: [
            SelectTriggerModel(
              title: '🚴 Biking',
              oneItem: true,
            ),
            SelectTriggerModel(
              title: '🏃 Running',
              oneItem: true,
            ),
          ]),
      SelectTriggerModel(title: 'Evening', child: [
        SelectTriggerModel(
          title:
              '🏓 Some very long names of action with many symbols in two, three, or four lines with text; the limit should be four lines.',
          oneItem: true,
        ),
        SelectTriggerModel(
          title: '🏐 Volleyball',
          oneItem: true,
        ),
      ]),
    ]),
    SelectTriggerModel(title: 'Work', child: [
      SelectTriggerModel(
        title: '🗓️ Meeting',
        oneItem: true,
      ),
      SelectTriggerModel(
        title: '🖨️ Print document',
        oneItem: true,
      ),
    ]),
    SelectTriggerModel(title: '⏰ Alarm', oneItem: true),
    SelectTriggerModel(title: '🎉 Party', oneItem: true),
    SelectTriggerModel(title: '🍜 Dinner', oneItem: true),
  ];
  List<SelectTriggerModel> selectTwo = [
    SelectTriggerModel(title: 'All Triggers'),
    SelectTriggerModel(title: 'Sport', child: [
      SelectTriggerModel(title: 'Morning', child: [
        SelectTriggerModel(
          title: '🚴 Biking',
          oneItem: true,
        ),
        SelectTriggerModel(
          title: '🏃 Running',
          oneItem: true,
        ),
      ]),
      SelectTriggerModel(title: 'Evening', child: [
        SelectTriggerModel(
          title: '🏓 Ping Pong',
          oneItem: true,
        ),
        SelectTriggerModel(
          title: '🏐 Volleyball',
          oneItem: true,
        ),
      ]),
      SelectTriggerModel(
        title: '🥊 Boxing',
        oneItem: true,
      ),
      SelectTriggerModel(
        title: '⚽ Football',
        oneItem: true,
      ),
    ]),
    SelectTriggerModel(title: 'Work', child: [
      SelectTriggerModel(
        title: '🗓️ Meeting',
        oneItem: true,
      ),
      SelectTriggerModel(
        title: '🖨️ Print document',
        oneItem: true,
      ),
    ]),
    SelectTriggerModel(title: '⏰ Alarm', oneItem: true),
    SelectTriggerModel(title: '🎉 Party', oneItem: true),
    SelectTriggerModel(title: '🍜 Dinner', oneItem: true),
  ];
  List<SelectTriggerModel> savedTriggerList1 = [];
  List<SelectTriggerModel> savedTriggerList2 = [];

  getActualOneTimeNoti() {
    notificationList.value.list.removeWhere((element) {
      return element.type == 'one_time' &&
          element.time.isBefore(DateTime.now());
    });
    notificationList.refresh();
    dataSave();
  }

  void getOneTimeNotiTimer() {
    List<NotificationData> tempList = [];
    notificationList.value.list.forEach((element) {
      if (element.type == 'one_time' && element.time.isAfter(DateTime.now())) {
        tempList.add(element);
      }
    });
    tempList.sort((a, b) => a.time.compareTo(b.time));
    tempList.isNotEmpty ? scheduleRecursiveFunction(tempList.first.time) : null;
  }

  void scheduleRecursiveFunction(DateTime scheduledTime) {
    Duration timeUntilScheduled = scheduledTime.difference(DateTime.now());
    Timer(timeUntilScheduled, () {
      getActualOneTimeNoti();
      getOneTimeNotiTimer();
    });
  }

  Future<StorageService> create() async {
    prefs = await SharedPreferences.getInstance();
    dataLoad();
    return this;
  }

  void dataLoad() {
    authToken = prefs.getString('auth_token') ?? '';
    notificationList.value =
        notificationDataFromJson(prefs.getString('list') ?? '{}');
    savedTriggerList1 = prefs.getString('savedTriggerList1') == null
        ? selectOne
        : savedTriggerListFromJson(
            prefs.getString('savedTriggerList1') ?? '[]');
    savedTriggerList2 = prefs.getString('savedTriggerList2') == null
        ? selectTwo
        : savedTriggerListFromJson(
            prefs.getString('savedTriggerList2') ?? '[]');
  }

  Future<void> dataSave() async {
    await prefs.setString('auth_token', authToken);
    await prefs.setString(
        'list', notificationDataToJson(notificationList.value));
    await prefs.setString(
        'savedTriggerList1', savedTriggerListToJson(savedTriggerList1));
    await prefs.setString(
        'savedTriggerList2', savedTriggerListToJson(savedTriggerList2));
  }

  Future<void> addPush() async {
    PushService pushService = Get.find();
    List<PushModel> result = [];
    notificationList.value.list.forEach((element) {
      if (element.type == 'one_time') {
        result.add(PushModel(
            title: "noti",
            body: element.message,
            payload: {},
            date: element.time));
      }
      if (element.type == '1_minute') {
        for (int i = 0; i < 64; i++) {
          result.add(PushModel(
              title: "noti",
              body: element.message,
              payload: {},
              date: element.time.add(Duration(minutes: i))));
        }
      }
      if (element.type == '3_minute') {
        for (int i = 0; i < 64; i++) {
          result.add(PushModel(
              title: "noti",
              body: element.message,
              payload: {},
              date: element.time.add(Duration(minutes: i * 3))));
        }
      }
      if (element.type == '5_minute') {
        for (int i = 0; i < 64; i++) {
          result.add(PushModel(
              title: "noti",
              body: element.message,
              payload: {},
              date: element.time.add(Duration(minutes: i * 5))));
        }
      }
    });
    result.removeWhere(
        (element) => element.date?.isBefore(DateTime.now()) ?? true);
    result.sort((a, b) {
      return b.date?.compareTo(a.date!) ?? 1;
    });
    result = result.reversed.toList();
    result = result.sublist(0, result.length > 64 ? 64 : result.length);
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await pushService.flutterLocalNotificationsPlugin
            .pendingNotificationRequests();
    for (var pending in pendingNotificationRequests) {
      pushService.flutterLocalNotificationsPlugin.cancel(pending.id);
    }
    int id = prefs.getInt('push_id') ?? 0;
    result.forEach((element) async {
      await pushService.showScheduledNotification(
        payload: jsonEncode(element.payload),
        id: id++,
        title: element.title,
        body: element.body,
        seconds: element.date!.difference(DateTime.now()).inSeconds,
      );
    });
    prefs.setInt('push_id', id);
  }
}
