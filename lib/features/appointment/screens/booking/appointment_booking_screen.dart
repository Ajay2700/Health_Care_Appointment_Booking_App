import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../controllers/appointment_controller.dart';
import '../../../doctor/controllers/doctor_controller.dart';
import '../../../../widgets/doctor_card.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import 'dart:ui';

class AppointmentBookingScreen extends StatefulWidget {
  final String doctorId;

  AppointmentBookingScreen({Key? key, required this.doctorId}) : super(key: key);

  @override
  State<AppointmentBookingScreen> createState() => _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  final appointmentController = Get.put(AppointmentController());
  final doctorController = Get.find<DoctorController>();
  bool showSuccess = false;
  bool bookingLoading = false;
  bool bookingSuccess = false;

  @override
  Widget build(BuildContext context) {
    final doctor = doctorController.getDoctorById(widget.doctorId);

    if (doctor == null) {
      return const Scaffold(
        body: Center(child: Text('Doctor not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF8FBFF), Color(0xFFEAF1FA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info Card
                    DoctorCard(
                      doctor: doctor,
                      showHospital: true,
                      showRating: false,
                      showLocation: false,
                      imageRadius: 30,
                      padding: const EdgeInsets.all(0),
                      showCTA: true,
                      onTap: () => Get.toNamed('/doctor-profile/${doctor.id}'),
              ),
              const SizedBox(height: 32),

              // Select Date
              Text(
                'Select Date',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appointmentController.getAvailableDates().length,
                  itemBuilder: (context, index) {
                    final date = appointmentController.getAvailableDates()[index];
                    final dateStr = DateFormat('yyyy-MM-dd').format(date);
                    return Obx(() {
                      final isSelected = appointmentController.selectedDate.value == dateStr;
                      return GestureDetector(
                        onTap: () => appointmentController.setSelectedDate(dateStr),
                        child: Container(
                          width: 80,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Theme.of(context).primaryColor
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('EEE').format(date),
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                DateFormat('d').format(date),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                DateFormat('MMM').format(date),
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Select Time Slot
              Text(
                'Select Time Slot',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: doctor.availableSlots.map((slot) {
                  return Obx(() {
                    final isSelected = appointmentController.selectedSlot.value == slot;
                    return GestureDetector(
                      onTap: () => appointmentController.setSelectedSlot(slot),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey[100],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          slot,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              const SizedBox(height: 32),

              // Package Details
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Package Details',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    _buildPackageDetail(
                      context,
                      Iconsax.clock,
                      'Duration',
                      '30 minutes',
                    ),
                    const SizedBox(height: 12),
                    _buildPackageDetail(
                      context,
                      Iconsax.money,
                      'Consultation Fee',
                      '\$${doctor.consultationFee.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            ),
          ),
          if (showSuccess)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                  child: Center(
                    child: TAnimationLoaderWidget(
                      animation: 'assets/images/animations/120978-payment-successful.json',
                      text: 'Appointment Booked Successfully!',
                      showAction: true,
                      actionText: 'View Appointments',
                      onActionPressed: () {
                        setState(() => showSuccess = false);
                        Get.offAllNamed('/appointments');
                      },
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Obx(() {
          final isDisabled = appointmentController.selectedDate.isEmpty || appointmentController.selectedSlot.isEmpty;
          return ElevatedButton(
            onPressed: isDisabled || bookingLoading ? null : () async {
              setState(() { bookingLoading = true; });
                    final success = await appointmentController.bookAppointment(
                      userId: 'dummy_user_id', // Replace with actual user ID
                      doctor: doctor,
                      selectedSlot: appointmentController.selectedSlot.value,
                appointmentDate: DateFormat('yyyy-MM-dd').parse(appointmentController.selectedDate.value),
                    );
              setState(() { bookingLoading = false; });
                    if (success) {
                setState(() {
                  bookingSuccess = true;
                  showSuccess = true;
                });
                    }
                  },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: bookingLoading
                ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                : bookingSuccess
                  ? const Icon(Icons.check_circle, color: Colors.white, size: 28)
                : const Text('Confirm Booking'),
          );
        }),
      ),
    );
  }

  Widget _buildPackageDetail(BuildContext context, IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).primaryColor, size: 24),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
              ),
        ),
            const SizedBox(height: 4),
        Text(
          value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              ),
          ],
        ),
      ],
    );
  }
}