import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../features/doctor/models/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;
  final VoidCallback? onTap;
  final bool showHospital;
  final bool showRating;
  final bool showLocation;
  final double imageRadius;
  final EdgeInsetsGeometry? padding;
  final bool showCTA;
  final bool showBookButton;

  const DoctorCard({
    Key? key,
    required this.doctor,
    this.onTap,
    this.showHospital = true,
    this.showRating = true,
    this.showLocation = true,
    this.imageRadius = 36,
    this.padding,
    this.showCTA = false,
    this.showBookButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isTopRated = doctor.rating >= 4.7;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.surface.withOpacity(0.98),
            theme.primaryColor.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.primaryColor.withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: 'doctor_image_${doctor.id}',
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: theme.primaryColor.withOpacity(0.18),
                              blurRadius: 16,
                              offset: const Offset(0, 6),
                            ),
                          ],
                          border: Border.all(
                            color: theme.primaryColor.withOpacity(0.18),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: imageRadius,
                          backgroundImage: NetworkImage(doctor.imageUrl),
                          backgroundColor: theme.colorScheme.surfaceVariant,
                        ),
                      ),
                    ),
                    if (isTopRated)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: theme.primaryColor.withOpacity(0.18),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(2),
                          child: const Icon(Iconsax.star1, color: Colors.white, size: 14),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 18),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              doctor.name,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (doctor.specialization.isNotEmpty)
                        Text(
                          doctor.specialization,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (showHospital && doctor.hospitalName.isNotEmpty)
                        Text(
                          doctor.hospitalName,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (showRating || showLocation)
                        Row(
                          children: [
                            if (showRating)
                              Row(
                                children: [
                                  _buildStars(doctor.rating, theme),
                                  const SizedBox(width: 4),
                                  Text(
                                    doctor.rating.toStringAsFixed(1),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ],
                              ),
                            if (showLocation && doctor.location.isNotEmpty) ...[
                              const SizedBox(width: 10),
                              Icon(Iconsax.location, size: 13, color: Colors.grey[500]),
                              const SizedBox(width: 2),
                              Flexible(
                                child: Text(
                                  doctor.location,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                    fontSize: 12.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ],
                        ),
                    ],
                  ),
                ),
                // Book Button
                if (showBookButton)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      onPressed: onTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        textStyle: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                        elevation: 0,
                      ),
                      child: const Text('Book'),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStars(double rating, ThemeData theme) {
    int fullStars = rating.floor();
    bool halfStar = (rating - fullStars) >= 0.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star_rounded, color: theme.primaryColor, size: 14);
        } else if (index == fullStars && halfStar) {
          return Icon(Icons.star_half_rounded, color: theme.primaryColor, size: 14);
        } else {
          return Icon(Icons.star_border_rounded, color: theme.primaryColor.withOpacity(0.4), size: 14);
        }
      }),
    );
  }
}
