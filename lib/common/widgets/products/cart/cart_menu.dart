//
//
// import 'package:e_commerce/features/shop/screens/cart/cart.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../utils/constants/colors.dart';
//
// class TCartCounterIcon extends StatelessWidget {
//   const TCartCounterIcon({
//     super.key,  required this.onPressed, required this.iconColor,
//   });
//
//   final Color iconColor;
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         IconButton(onPressed: ()=> Get.to(()=> CartScreen()), icon: Icon(Iconsax.shopping_bag, color: iconColor)),
//         Positioned(
//           right: 0,
//           child: Container(
//             width: 18,
//             height: 18,
//             decoration: BoxDecoration(
//               color: TColors.black,
//               borderRadius: BorderRadius.circular(100),
//             ), // BoxDecoration
//             child: Center(
//               child: Text('2', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white, fontSizeFactor: 0.8)), // Center
//             ), // Container
//           ), // Positioned
//         ),
//       ],
//     );
//   }
// }
//
