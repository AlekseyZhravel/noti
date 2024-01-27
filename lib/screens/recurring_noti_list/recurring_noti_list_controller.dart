import 'package:get/get.dart';
import 'package:test_project/models/notification_model.dart';
import 'package:test_project/screens/create_noti/create_noti_screen.dart';
import 'package:test_project/service/storage_service.dart';

class RecurringNotiController extends GetxController {
  final StorageService storageService = Get.find();
  List<NotificationData> tempNotiList = [];
  String type = Get.arguments['type'];

  @override
  void onInit() {
    super.onInit();
    separatedNotiList();
  }

  void manageNotiCard({bool? createCard, int? index}) {
    Get.toNamed(CreateNotiScreen.routeName, arguments: {
      'type': type,
      'noti_card_data': index == null ? null : tempNotiList[index],
      'isNewCard': createCard,
    })!
        .then((value) {
      separatedNotiList();
      update(['recurring_noti_list']);
    });
  }

  void separatedNotiList() {
    tempNotiList.clear();
    tempNotiList.addAll(storageService.notificationList.value.list
        .where((element) => element.type == Get.arguments['type']));
  }

  void delete(int index) {
    storageService.notificationList.value.list.remove(tempNotiList[index]);
    storageService.notificationList.refresh();
    storageService.dataSave();
    separatedNotiList();
    update(['recurring_noti_list']);
    storageService.addPush();
  }
}
