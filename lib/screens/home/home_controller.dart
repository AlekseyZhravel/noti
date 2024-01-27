import 'package:get/get.dart';
import 'package:test_project/models/notification_model.dart';
import 'package:test_project/screens/create_noti/create_noti_screen.dart';
import 'package:test_project/service/storage_service.dart';

class HomeController extends GetxController {
  final StorageService storageService = Get.find();
  List<NotificationData> tempNotiList = [];
  List<int> minutesList = [1, 3, 5];
  bool isOneTimeListShow = true;

  @override
  void onInit() {
    super.onInit();
    storageService.addPush();
    separatedNotiList();
    storageService.getOneTimeNotiTimer();
    ever(storageService.notificationList, (callback) async {
      separatedNotiList();
      update(['noti_list']);
    });
  }

  void manageNotiCard({bool? createCard, int? index}) {
    Get.toNamed(CreateNotiScreen.routeName, arguments: {
      'type': 'one_time',
      'noti_card_data': index == null ? null : tempNotiList[index],
      'isNewCard': createCard
    })!
        .then((value) {
      separatedNotiList();
      update(['noti_list']);
      storageService.getOneTimeNotiTimer();
    });
  }

  void deleteCard(int index) {
    storageService.notificationList.value.list.remove(tempNotiList[index]);
    storageService.dataSave();
    separatedNotiList();
    update(['noti_list']);
    storageService.addPush();
    storageService.getOneTimeNotiTimer();
  }

  void separatedNotiList() {
    tempNotiList.clear();
    tempNotiList.addAll(storageService.notificationList.value.list
        .where((element) => element.type == 'one_time'));
  }
}
