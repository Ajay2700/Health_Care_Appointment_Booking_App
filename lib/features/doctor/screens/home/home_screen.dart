import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../controllers/doctor_controller.dart';
import 'filtered_doctor_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  final doctorController = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                // Top Bar
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                    children: [
                        const Icon(Iconsax.location, size: 20, color: Colors.grey),
                        const SizedBox(width: 4),
                        DropdownButton<String>(
                          value: 'Seattle, USA',
                          underline: SizedBox(),
                          icon: const Icon(Iconsax.arrow_down_1, size: 16),
                          items: [
                            DropdownMenuItem(value: 'Seattle, USA', child: Text('Seattle, USA')),
                            DropdownMenuItem(value: 'New York, USA', child: Text('New York, USA')),
                          ],
                          onChanged: (v) {},
                      ),
                    ],
                  ),
                  IconButton(
                      icon: const Icon(Iconsax.notification, color: Colors.grey),
                    onPressed: () {},
                  ),
                ],
              ),
                const SizedBox(height: 12),
            // Search Bar
                TextField(
                controller: searchController,
                decoration: InputDecoration(
                    hintText: 'Search doctor...',
                  prefixIcon: const Icon(Iconsax.search_normal),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  ),
                ),
                const SizedBox(height: 18),
                // Promotional Banner
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CB8C4),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Looking for\nSpecialist Doctors?',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Schedule an appointment.',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                              ),
                ],
              ),
            ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/on_boarding_images/onboarding_1.gif',
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
            ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const SizedBox(height: 22),
                // Categories Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
                    Text('Categories', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                      style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColor),
          ),
        ],
      ),
                // Categories Grid
                Obx(() => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: doctorController.categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final cat = doctorController.categories[index];
                    return Hero(
                      tag: 'category_${cat.id}',
                      child: TVerticalImageText(
                        image: cat.iconPath,
                        title: cat.name,
                        backgroundColor: cat.backgroundColor,
                        textColor: Colors.black87,
                        onTap: () {
                          Get.to(() => FilteredDoctorListScreen(
                            filterType: 'category',
                            filterValue: cat.name,
                            heroTag: 'category_${cat.id}',
                          ), transition: Transition.fadeIn);
                        },
                  ),
                    );
                  },
                )),
                const SizedBox(height: 22),
                // Medical Centers Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nearby Medical Centers', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('See All'),
                      style: TextButton.styleFrom(foregroundColor: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                Obx(() => SizedBox(
                  height: 120,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorController.medicalCenters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final center = doctorController.medicalCenters[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => FilteredDoctorListScreen(
                            filterType: 'center',
                            filterValue: center.name,
                            heroTag: 'center_${center.id}',
                          ), transition: Transition.fadeIn);
                        },
                        child: Hero(
                          tag: 'center_${center.id}',
                          child: Container(
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(14),
                                    topRight: Radius.circular(14),
                                  ),
                                  child: Image.asset(
                                    center.imageUrl,
                                    width: 160,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    center.name,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                                    maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                ),
              ),
                      );
                    },
                  ),
                )),
                const SizedBox(height: 18),
            ],
            ),
          ),
        ),
      ),
    );
  }
}