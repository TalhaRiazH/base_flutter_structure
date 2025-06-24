import 'package:base_project/app/views/home/views/home_view.dart';
import 'package:get/get.dart';

import '../views/home/views/todos_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    // Auth
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeView()),
    GetPage(name: AppRoutes.todosScreen, page: () => TodoListWidget()),
  ];
}
