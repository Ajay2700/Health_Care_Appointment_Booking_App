import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/features/doctor/controllers/doctor_controller.dart';
import 'package:project_1/features/appointment/controllers/appointment_controller.dart';
import 'package:project_1/features/personalization/controllers/user_controller.dart';
import 'package:project_1/routes/app_routes.dart';
import 'package:project_1/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      initialBinding: BindingsBuilder(() {
        // Get.put(AuthController());
        Get.put(DoctorController());
        Get.put(AppointmentController());
        Get.put(UserController());


      }),
    );
  }
}