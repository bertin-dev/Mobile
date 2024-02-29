// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:secure_app/gen/assets.gen.dart';
// import 'package:secure_app/ressources/app_colors.dart';
// import 'package:secure_app/ressources/app_styles.dart';

// class ProfileSettingsComponent extends StatelessWidget {
//   final String title;
//   final String icon;
//   const ProfileSettingsComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         Text("Aide"),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SvgPicture.asset(
//                   Assets.icons.service,
//                   color: AppColors.primary,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 26.0),
//                   child: Text(
//                     "Service client",
//                     textAlign: TextAlign.center,
//                     style: AppStyles.textStyle(
//                       color: AppColors.dark,
//                       size: 14.0,
//                       weight: FontWeight.w500,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             Icon(
//               FontAwesomeIcons.chevronRight,
//               size: 20.0,
//             )
//           ],
//         )
//       ]),
//     );
//   }
// }
