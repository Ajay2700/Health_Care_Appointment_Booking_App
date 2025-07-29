// import 'package:e_commerce/common/widgets/text/product_price_text.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
//
// import '../../../../utils/constants/colors.dart';
// import '../../../../utils/constants/image_strings.dart';
// import '../../../../utils/constants/sizes.dart';
// import '../../../../utils/helpers/helper_functions.dart';
// import '../../../styles/rounded_container.dart';
// import '../../../styles/shadows.dart';
// import '../../../styles/t_rounded_image.dart';
// import '../../icons/t_circular_icon.dart';
// import '../../text/product_title_text.dart';
// import '../../text/t_brand_title_text_with_verified_icon.dart';
//
// class TProductCardHorizontal extends StatelessWidget {
//   const TProductCardHorizontal({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//
//     return Container(
//       width: 310,
//       padding: const EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//         color: dark ? TColors.darkerGrey : TColors.softGrey,
//       ), // BoxDecoration
//       child: Row(
//
//         children: [
//           /// Thumbnail
//           TRoundedContainer(
//             height: 120,
//             padding: const EdgeInsets.all(TSizes.sm),
//             backgroundColor: dark ? TColors.dark : TColors.light,
//             child: Stack(
//               children: [
//                 /// -- Thumbnail Image
//                 SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: TRoundedImage(
//                         imageUrl: TImages.productImage1,
//                         applyImageRadius: true)),
//
//                 /// -- Sale Tag
//                 Positioned(
//                   top: 10,
//                   child: TRoundedContainer(
//                     radius: TSizes.sm,
//                     backgroundColor: TColors.secondary.withOpacity(0.8),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: TSizes.sm, vertical: TSizes.xs),
//                     child: Text('25%',
//                         style: Theme.of(context)
//                             .textTheme
//                             .labelLarge
//                             ?.apply(color: TColors.black)),
//                   ),
//                 ),
//
//                 /// -- Favourite Icon Button
//                 ///
//                 Positioned(
//                     top: -12,
//                     right: 0,
//                     child: TCircularIcon(
//                       icon: Iconsax.heart5,
//                       color: Colors.red,
//                     ))
//               ],
//             ),
//           ),
//
//           /// Details
//           SizedBox(
//             width: 172,
//             child: Padding(
//               padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const TProductTitleText(
//                           title: 'Green Nike Half Sleeves Shirt',
//                           smallSize: true),
//                       SizedBox(height: TSizes.spaceBtwItems / 2),
//                       const TBrandTitleWithVerifiedIcon(title: 'Nike'),
//                     ],
//                   ),
//                   Spacer(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ///Pricing
//                       Flexible(child: TProductPriceText(price: '259.0')),
//
//                       ///Add to Cart
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: TColors.dark,
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(TSizes.cardRadiusMd),
//                             bottomRight:
//                                 Radius.circular(TSizes.productImageRadius),
//                           ), // BorderRadius.only
//                         ), // BoxDecoration
//                         child: const SizedBox(
//                           width: TSizes.iconLg * 1.2,
//                           height: TSizes.iconLg * 1.2,
//                           child: Center(
//                               child: Icon(Iconsax.add, color: TColors.white)),
//                         ), // SizedBox
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ), // Column
//         ],
//       ), // Row
//     ); // Container
//   }
// }
