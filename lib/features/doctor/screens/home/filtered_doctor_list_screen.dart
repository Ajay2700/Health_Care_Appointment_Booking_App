import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/doctor_controller.dart';
import '../../models/doctor_model.dart';
import '../../../../widgets/doctor_card.dart';

class FilteredDoctorListScreen extends StatelessWidget {
  final String filterType; // 'category' or 'center'
  final String filterValue;
  final String heroTag;

  FilteredDoctorListScreen({required this.filterType, required this.filterValue, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    final doctorController = Get.find<DoctorController>();
    List<DoctorModel> doctors = filterType == 'category'
        ? doctorController.getDoctorsByCategory(filterValue)
        : doctorController.getDoctorsByMedicalCenter(filterValue);
    return Scaffold(
      appBar: AppBar(
        title: Text(filterValue),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Hero(
            tag: heroTag,
            child: Container(
              width: double.infinity,
              height: 80,
              color: Colors.transparent,
              alignment: Alignment.center,
              child: Text(
                filterValue,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: doctors.isEmpty
                ? Center(child: Text('No doctors found.'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(milliseconds: 400 + index * 80),
                        builder: (context, value, child) => Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: child,
                          ),
                        ),
                        child: DoctorCard(
                          doctor: doctor,
                          onTap: () => Get.toNamed('/doctor-profile/${doctor.id}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
} 