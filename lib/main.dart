import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'core/Constants/app_colors.dart';
import 'core/Managers/PrefManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetStorage
  await PrefManager.init();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Salon',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        //  home: PrefManager.isLogin() == true ? MainScreen() : LoginScreen(),
        initialRoute: AppRoutes.homeScreen,
        getPages: AppPages.routes,
      ),
    );
  }
}
