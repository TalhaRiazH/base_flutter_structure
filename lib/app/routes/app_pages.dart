import 'package:base_project/app/views/home/views/home_view.dart';
import 'package:get/get.dart';

import '../../splash_screen.dart';
import '../views/home/views/todos_view.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    // Auth
    GetPage(name: AppRoutes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeView()),
    GetPage(name: AppRoutes.todosScreen, page: () => TodoListWidget()),
  ];
}
