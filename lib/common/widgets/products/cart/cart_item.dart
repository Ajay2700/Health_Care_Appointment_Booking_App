//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../styles/t_rounded_image.dart';
// import 'package:e_commerce/common/widgets/text/product_title_text.dart';
// import 'package:e_commerce/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
// import 'package:e_commerce/utils/constants/colors.dart';
// import 'package:e_commerce/utils/constants/image_strings.dart';
// import 'package:e_commerce/utils/constants/sizes.dart';
// import 'package:e_commerce/utils/helpers/helper_functions.dart';
//
// class TCartItem extends StatelessWidget {
//   const TCartItem({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         /// Image
//         TRoundedImage(
//           imageUrl: TImages.productImage1,
//           width: 60,
//           height: 60,
//           padding: EdgeInsets.all(TSizes.sm),
//           backgroundColor: THelperFunctions.isDarkMode(context)? TColors.darkerGrey : TColors.light,
//         ),
//         SizedBox(width: TSizes.spaceBtwItems,),
//
//
//         /// Title , Price , Size
//         Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TBrandTitleWithVerifiedIcon(title: 'Nike'),
//               Flexible(child: TProductTitleText(title: 'Black Sports shoes', maxLines: 1,)),
//
//               ///   TextSpan
//               Text.rich(
//                   TextSpan(
//                       children: [
//                         TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
//                         TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
//                         TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
//                         TextSpan(text: 'UK 10 ', style: Theme.of(context).textTheme.bodySmall),
//
//                       ]
//                   ))
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
