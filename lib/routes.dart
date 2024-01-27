import 'package:get/get.dart';
import 'package:test_project/bindings.dart';
import 'package:test_project/middleware/login_middleware.dart';
import 'package:test_project/screens/create_noti/create_noti_screen.dart';
import 'package:test_project/screens/home/home_screen.dart';
import 'package:test_project/screens/login/login_screen.dart';
import 'package:test_project/screens/select_trigger/select_trigger_screen.dart';
import 'package:test_project/screens/recurring_noti_list/recurring_noti_list_screen.dart';

class AppScreen {
  static final routes = [
    GetPage(
      name: LoginScreen.routeName,
      page: () => LoginScreen(),
      binding: Binding(),
    ),
    GetPage(
        name: HomeScreen.routeName,
        page: () => HomeScreen(),
        binding: Binding(),
        middlewares: [
          IfNoAuth(),
        ]),
    GetPage(
      name: CreateNotiScreen.routeName,
      page: () => CreateNotiScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: SelectTrigger.routeName,
      page: () => SelectTrigger(),
      binding: Binding(),
    ),
    GetPage(
      name: RecurringNotiScreen.routeName,
      page: () => RecurringNotiScreen(),
      binding: Binding(),
    ),
  ];
}
