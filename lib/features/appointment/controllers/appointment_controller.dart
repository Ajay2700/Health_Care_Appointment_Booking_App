import 'package:get/get.dart';
import '../../doctor/models/doctor_model.dart';
import '../models/appointment_model.dart';

class AppointmentController extends GetxController {
  final RxList<AppointmentModel> appointments = <AppointmentModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
  final RxString selectedSlot = ''.obs;
  final RxString selectedDate = ''.obs;

  void setSelectedSlot(String slot) => selectedSlot.value = slot;
  void setSelectedDate(String date) => selectedDate.value = date;

  List<DateTime> getAvailableDates() {
    final now = DateTime.now();
    return List.generate(7, (i) => now.add(Duration(days: i + 1)));
  }

  // Book an appointment
  Future<bool> bookAppointment({
    required String userId,
    required DoctorModel doctor,
    required String selectedSlot,
    required DateTime appointmentDate,
  }) async {
    isLoading.value = true;
    error.value = '';
    await Future.delayed(const Duration(seconds: 1));
    // Prevent double-booking
    final alreadyBooked = appointments.any((a) =>
      a.doctor.id == doctor.id &&
      a.selectedSlot == selectedSlot &&
      a.appointmentDate == appointmentDate
    );
    if (alreadyBooked) {
      error.value = 'This slot is already booked.';
      isLoading.value = false;
      return false;
    }
    final newAppointment = AppointmentModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      doctor: doctor,
      selectedSlot: selectedSlot,
      appointmentDate: appointmentDate,
      status: 'confirmed',
      bookedAt: DateTime.now(),
      amount: doctor.consultationFee,
    );
    appointments.add(newAppointment);
    isLoading.value = false;
    return true;
  }

  // Get appointments for a user
  List<AppointmentModel> getUserAppointments(String userId) {
    return appointments.where((a) => a.userId == userId).toList();
  }

  // Cancel an appointment
  void cancelAppointment(String appointmentId) {
    appointments.removeWhere((a) => a.id == appointmentId);
  }
}