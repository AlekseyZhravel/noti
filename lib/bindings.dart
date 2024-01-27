import 'package:get/get.dart';
import 'package:test_project/screens/create_noti/create_noti_controller.dart';
import 'package:test_project/screens/home/home_controller.dart';
import 'package:test_project/screens/login/login_controller.dart';
import 'package:test_project/screens/recurring_noti_list/recurring_noti_list_controller.dart';
import 'package:test_project/screens/select_trigger/triggers_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<CreateNotiController>(
      () => CreateNotiController(),
    );
    Get.lazyPut<RecurringNotiController>(
      () => RecurringNotiController(),
    );
    Get.lazyPut<TriggersController>(
      () => TriggersController(),
    );
  }
}
