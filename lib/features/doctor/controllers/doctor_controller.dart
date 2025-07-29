import 'package:get/get.dart';
import '../models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorController extends GetxController {
  static DoctorController get instance => Get.find();

  final RxList<DoctorModel> doctors = <DoctorModel>[].obs;
  final RxBool isLoading = false.obs;

  // Add these:
  final RxList<MedicalCenterModel> medicalCenters = <MedicalCenterModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDoctors();
    loadMedicalCenters();
    loadCategories();
  }

  Future<void> loadDoctors() async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 800));
      doctors.value = [
        DoctorModel(
          id: '1',
          name: 'Dr. Sarah Johnson',
          specialization: 'Cardiology',
          imageUrl: 'https://randomuser.me/api/portraits/women/44.jpg',
          rating: 4.8,
          experience: '15 years',
          description: 'Specialized in cardiovascular diseases with extensive experience in treating heart conditions.',
          availableSlots: ['09:00 AM', '10:00 AM', '11:00 AM', '02:00 PM', '03:00 PM'],
          consultationFee: 150.0,
          hospitalName: 'Golden Cardiology',
          location: 'New York, USA',
        ),
        DoctorModel(
          id: '2',
          name: 'Dr. Michael Chen',
          specialization: 'Pediatrics',
          imageUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
          rating: 4.9,
          experience: '12 years',
          description: 'Dedicated pediatrician focused on providing comprehensive care for children of all ages.',
          availableSlots: ['09:30 AM', '10:30 AM', '11:30 AM', '02:30 PM', '03:30 PM'],
          consultationFee: 120.0,
          hospitalName: 'Downtown Pediatrics',
          location: 'Chicago, USA',
        ),
        DoctorModel(
          id: '3',
          name: 'Dr. Emily Williams',
          specialization: 'Dermatology',
          imageUrl: 'https://randomuser.me/api/portraits/women/65.jpg',
          rating: 4.7,
          experience: '10 years',
          description: 'Expert in treating various skin conditions and cosmetic dermatology.',
          availableSlots: ['10:00 AM', '11:00 AM', '12:00 PM', '02:00 PM', '04:00 PM'],
          consultationFee: 180.0,
          hospitalName: 'City Medical Center',
          location: 'Los Angeles, USA',
        ),
        DoctorModel(
          id: '4',
          name: 'Dr. Priya Patel',
          specialization: 'Dentistry',
          imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
          rating: 4.6,
          experience: '8 years',
          description: 'Experienced dentist with a focus on cosmetic and pediatric dentistry.',
          availableSlots: ['09:00 AM', '10:00 AM', '01:00 PM', '03:00 PM'],
          consultationFee: 100.0,
          hospitalName: 'Sunrise Health Clinic',
          location: 'Seattle, USA',
        ),
        DoctorModel(
          id: '5',
          name: 'Dr. John Smith',
          specialization: 'Neurology',
          imageUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
          rating: 4.5,
          experience: '14 years',
          description: 'Neurologist with a passion for helping patients with complex neurological disorders.',
          availableSlots: ['08:00 AM', '09:00 AM', '11:00 AM', '01:00 PM'],
          consultationFee: 200.0,
          hospitalName: 'Golden Cardiology',
          location: 'New York, USA',
        ),
      ];
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load doctors',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void loadMedicalCenters() {
    medicalCenters.value = [
      MedicalCenterModel(
        id: '1',
        name: 'Sunrise Health Clinic',
        imageUrl: 'assets/images/banners/banner_1.jpg',
        location: 'Seattle, USA',
      ),
      MedicalCenterModel(
        id: '2',
        name: 'Golden Cardiology',
        imageUrl: 'assets/images/banners/banner_2.jpg',
        location: 'New York, USA',
      ),
      MedicalCenterModel(
        id: '3',
        name: 'City Medical Center',
        imageUrl: 'assets/images/banners/banner_3.jpg',
        location: 'Los Angeles, USA',
      ),
      MedicalCenterModel(
        id: '4',
        name: 'Downtown Pediatrics',
        imageUrl: 'assets/images/banners/banner_4.jpg',
        location: 'Chicago, USA',
      ),
    ];
  }

  void loadCategories() {
    categories.value = [
      CategoryModel(
        id: '1',
        name: 'Dentistry',
        iconPath: 'assets/icons/categories/icons8-dental-care-64.png',
        backgroundColor: Color(0xFFFEE3E3),
      ),
      CategoryModel(
        id: '2',
        name: 'Cardiology',
        iconPath: 'assets/icons/categories/icons8-heart-health-64.png',
        backgroundColor: Color(0xFFE3F6F5),
      ),
      CategoryModel(
        id: '3',
        name: 'Pulmonology',
        iconPath: 'assets/icons/categories/icons8-lungs-64.png',
        backgroundColor: Color(0xFFFFF4E3),
      ),
      CategoryModel(
        id: '4',
        name: 'General',
        iconPath: 'assets/icons/categories/icons8-doctor-male-64.png',
        backgroundColor: Color(0xFFE3E7FE),
      ),
      CategoryModel(
        id: '5',
        name: 'Neurology',
        iconPath: 'assets/icons/categories/icons8-brain-64.png',
        backgroundColor: Color(0xFFE3F6E3),
      ),
      CategoryModel(
        id: '6',
        name: 'Gastroenterology',
        iconPath: 'assets/icons/categories/icons8-stomach-64.png',
        backgroundColor: Color(0xFFE3E3F6),
      ),
      CategoryModel(
        id: '7',
        name: 'Laboratory',
        iconPath: 'assets/icons/categories/icons8-laboratory-64.png',
        backgroundColor: Color(0xFFF6E3F6),
      ),
      CategoryModel(
        id: '8',
        name: 'Vaccination',
        iconPath: 'assets/icons/categories/icons8-syringe-64.png',
        backgroundColor: Color(0xFFE3F6F6),
      ),
    ];
  }

  DoctorModel? getDoctorById(String id) {
    try {
      return doctors.firstWhere((doctor) => doctor.id == id);
    } catch (e) {
      return null;
    }
  }

  List<DoctorModel> searchDoctors(String query) {
    if (query.isEmpty) return doctors;
    
    query = query.toLowerCase();
    return doctors.where((doctor) {
      return doctor.name.toLowerCase().contains(query) ||
          doctor.specialization.toLowerCase().contains(query) ||
          doctor.hospitalName.toLowerCase().contains(query);
    }).toList();
  }

  // Filter doctors by category name
  List<DoctorModel> getDoctorsByCategory(String categoryName) {
    return doctors.where((d) => d.specialization.toLowerCase().contains(categoryName.toLowerCase()) || d.hospitalName.toLowerCase().contains(categoryName.toLowerCase())).toList();
  }

  // Filter doctors by medical center name
  List<DoctorModel> getDoctorsByMedicalCenter(String centerName) {
    return doctors.where((d) => d.hospitalName.toLowerCase().contains(centerName.toLowerCase())).toList();
  }

  // Get available slots for a doctor (mock logic, could be improved)
  List<String> getAvailableSlots(String doctorId) {
    final doctor = getDoctorById(doctorId);
    if (doctor == null) return [];
    // In a real app, filter out booked slots
    return doctor.availableSlots;
  }

  // Check if a slot is already booked (mock logic)
  bool isSlotBooked(String doctorId, String slot, DateTime date) {
    // In a real app, check appointments for this doctor/date/slot
    return false;
  }
}