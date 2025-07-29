import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../doctor/controllers/doctor_controller.dart';
import '../controllers/appointment_controller.dart';

class AppointmentListScreen extends StatelessWidget {
  final String userId;
  const AppointmentListScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentController = Get.find<AppointmentController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        centerTitle: true,
      ),
      body: Obx(() {
        final appointments = appointmentController.getUserAppointments(userId);
        if (appointments.isEmpty) {
          return Center(child: Text('No appointments booked yet.'));
        }
        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: appointments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final appt = appointments[index];
            final doctor = appt.doctor;
            return GestureDetector(
              onTap: () => Get.toNamed('/doctor-profile/${doctor.id}'),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Hero(
                        tag: 'doctor_image_${doctor.id}',
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(doctor.imageUrl),
                          radius: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(doctor.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            Text(doctor.specialization, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).primaryColor)),
                            Text('${appt.appointmentDate.toLocal()}'.split(' ')[0] + ' at ' + appt.selectedSlot, style: Theme.of(context).textTheme.bodySmall),
                            Text('Status: ${appt.status}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
} 