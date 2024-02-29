import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/screens/main_screen/screens/unverified_home_screen.dart';

class TransactionFailedScreen extends StatelessWidget {
  TransactionFailedScreen({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final FormController _formController = Get.put(FormController());
  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                Assets.images.failedBottomBg,
                width: Constants.screenWidth(context),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 82,
                  height: 82,
                  child: Stack(
                    children: [
//                       Container(
//   width: 82,
//   height: 82,
//   child: Stack(
//     children: [
//       Positioned(
//         left: 0,
//         top: 0,
//         child: Container(
//           width: 82,
//           height: 82,
//           decoration: ShapeDecoration(
//             color: Color(0xFFFB2C2C),
//             shape: OvalBorder(),
//           ),
//         ),
//       ),
//       Positioned(
//         left: 28,
//         top: 28,
//         child: Container(
//           width: 26.09,
//           height: 26.09,
//           child: Stack(children: [
//           ,
//           ]),
//         ),
//       ),
//     ],
//   ),
// ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFB2C2C),
                            shape: OvalBorder(),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.close,
                            color: AppColors.white,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 74.0, right: 74.0, top: 29.0, bottom: 19.0),
                  child: SizedBox(
                    width: 194,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: _topNavBarController.loaderProvider.value ==
                                    "transfert"
                                ? "Transfert "
                                : _topNavBarController.loaderProvider.value ==
                                        "buy card"
                                    ? "Achat de carte "
                                    : _formController
                                            .isRechargeBottomSheet.value
                                        ? 'Recharge '
                                        : 'Retrait ',
                            style: AppStyles.textStyle(
                              color: const Color(0xFFFB2C2C),
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: 'é',
                            style: TextStyle(
                              color: Color(0xFFFB2C2C),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          TextSpan(
                            text: 'chou',
                            style: AppStyles.textStyle(
                              color: const Color(0xFFFB2C2C),
                              size: 30,
                              weight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          const TextSpan(
                            text: 'é',
                            style: TextStyle(
                              color: Color(0xFFFB2C2C),
                              fontSize: 30,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                            ),
                          ),
                          if (_formController.isRechargeBottomSheet.value)
                            TextSpan(
                              text: 'e',
                              style: AppStyles.textStyle(
                                color: const Color(0xFFFB2C2C),
                                size: 30,
                                weight: FontWeight.w500,
                                height: 0.9,
                              ),
                            ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 69.0, right: 69.0, bottom: 16.0),
                  // width: 256,
                  // height: 45,
                  child: Text(
                    'Oups, quelque chose a mal tourné, merci de recommencer la transaction',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.9,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_topNavBarController.loaderProvider.value ==
                        "buy card") {
                      _topNavBarController.setPageIndex(6);
                    } else if (_topNavBarController.loaderProvider.value !=
                        "transfert") {
                      // _formController.isBottomSheetShow(true);s
                      _formController.isAccountTransactionBottomSheetShow(true);
                      _topNavBarController.setPageIndex(0);
                    } else {
                      _topNavBarController.setPageIndex(2);
                    }
                    Get.off(() => MainScreen());

                    // _topNavBarController.setPageIndex(7);
                    // Get.off(() => MainScreen());
                    // Get.off(MainScreen());
                    // Get.off(() => LoaderScreen());
                  },
                  child: Container(
                    // width: double.infinity,
                    margin: const EdgeInsets.only(left: 90.0, right: 90.0),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFB2C2C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x38FFF27F),
                          blurRadius: 7,
                          offset: Offset(0, 12),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'Recommencer',
                          style: AppStyles.textStyle(
                            color: AppColors.white,
                            size: 14,
                            weight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_topNavBarController.loaderProvider.value ==
                        "card transaction") {
                      _topNavBarController.pageIndex(0);
                      // _topNavBarController.scrollController.jumpTo(0);
                    } else if (_topNavBarController.loaderProvider.value ==
                        "buy card") {
                      _topNavBarController.setPageIndex(6);
                    } else if (_topNavBarController.loaderProvider.value ==
                        "transfert") {
                      _topNavBarController.pageIndex(2);
                    }
                    Get.off(() => MainScreen());
                    // Get.off(MainScreen());
                    _transactionController.clearData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11.0),
                    child: Container(
                      // width: double.infinity,
                      margin: const EdgeInsets.only(left: 88.0, right: 88.0),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF4EFE3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      child: const Center(
                        child: FittedBox(
                          child: Text(
                            'Retour',
                            style: TextStyle(
                              color: Color(0xFFFB2C2C),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
