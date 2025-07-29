import 'package:project_1/features/doctor/models/doctor_model.dart';

class AppointmentModel {
  final String id;
  final String userId;
  final DoctorModel doctor;
  final String selectedSlot;
  final DateTime appointmentDate;
  final String status; // 'pending', 'confirmed', 'cancelled'
  final DateTime bookedAt;
  final double amount;

  AppointmentModel({
    required this.id,
    required this.userId,
    required this.doctor,
    required this.selectedSlot,
    required this.appointmentDate,
    required this.status,
    required this.bookedAt,
    required this.amount,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      doctor: DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      selectedSlot: json['selectedSlot'] as String,
      appointmentDate: DateTime.parse(json['appointmentDate'] as String),
      status: json['status'] as String,
      bookedAt: DateTime.parse(json['bookedAt'] as String),
      amount: (json['amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'doctor': doctor.toJson(),
      'selectedSlot': selectedSlot,
      'appointmentDate': appointmentDate.toIso8601String(),
      'status': status,
      'bookedAt': bookedAt.toIso8601String(),
      'amount': amount,
    };
  }
}