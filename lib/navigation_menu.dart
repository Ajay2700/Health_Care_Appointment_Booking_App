import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_1/features/appointment/screens/booking/appointment_booking_screen.dart';
import 'package:project_1/features/authentication/screens/login/login.dart';
import 'package:project_1/features/personalization/screens/profile/profile.dart';
import 'package:project_1/utils/constants/colors.dart';
import 'package:project_1/utils/helpers/helper_functions.dart';

import 'features/doctor/screens/home/home_screen.dart';
import 'features/appointment/screens/appointment_list_screen.dart';
import 'features/personalization/controllers/user_controller.dart';


class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=>  controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode ? TColors.white.withOpacity(0.12) : TColors.primary.withOpacity(0.12),
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.calendar), label: 'Appointments'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ]
        ),
      ),
      body: Obx(()=>controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{

  final Rx <int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    // Use the current user's ID for appointments
    AppointmentListScreen(userId: UserController.instance.user.value.id),
    ProfileScreen(),
    ProfileScreen()

    // const StoreScreen(),
    // const FavouriteScreen(),
    // const SettingsScreen(),
  ];
}