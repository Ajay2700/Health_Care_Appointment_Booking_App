import 'package:get/get.dart';
import '../features/authentication/screens/login/login.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/doctor/screens/home/home_screen.dart';
import '../features/doctor/screens/profile/doctor_profile_screen.dart';
import '../features/appointment/screens/booking/appointment_booking_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String doctorProfile = '/doctor-profile/:id';
  static const String bookAppointment = '/book-appointment/:id';

  static final routes = [
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: doctorProfile,
      page: () {
        final doctorId = Get.parameters['id']!;
        return DoctorProfileScreen(doctorId: doctorId);
      },
    ),
    GetPage(
      name: bookAppointment,
      page: () {
        final doctorId = Get.parameters['id']!;
        return AppointmentBookingScreen(doctorId: doctorId);
      },
    ),
  ];
}