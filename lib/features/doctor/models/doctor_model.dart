import 'package:flutter/material.dart';

class DoctorModel {
  final String id;
  final String name;
  final String specialization;
  final String imageUrl;
  final double rating;
  final String experience;
  final String description;
  final List<String> availableSlots;
  final double consultationFee;
  final String hospitalName;
  final String location;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialization,
    required this.imageUrl,
    required this.rating,
    required this.experience,
    required this.description,
    required this.availableSlots,
    required this.consultationFee,
    required this.hospitalName,
    required this.location,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      specialization: json['specialization'] as String,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num).toDouble(),
      experience: json['experience'] as String,
      description: json['description'] as String,
      availableSlots: List<String>.from(json['availableSlots']),
      consultationFee: (json['consultationFee'] as num).toDouble(),
      hospitalName: json['hospitalName'] as String,
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'imageUrl': imageUrl,
      'rating': rating,
      'experience': experience,
      'description': description,
      'availableSlots': availableSlots,
      'consultationFee': consultationFee,
      'hospitalName': hospitalName,
      'location': location,
    };
  }
}

class MedicalCenterModel {
  final String id;
  final String name;
  final String imageUrl;
  final String location;

  MedicalCenterModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.location,
  });

  factory MedicalCenterModel.fromJson(Map<String, dynamic> json) {
    return MedicalCenterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      location: json['location'] as String,
    );
  }
}

class CategoryModel {
  final String id;
  final String name;
  final String iconPath;
  final Color backgroundColor;

  CategoryModel({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.backgroundColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      backgroundColor: Color(int.parse(json['backgroundColor'])),
    );
  }
}