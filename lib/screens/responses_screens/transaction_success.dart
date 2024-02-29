import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/unverified_home_screen.dart';

class TransactionSuccessScreen extends StatelessWidget {
  final bool isOnlyContinue;
  TransactionSuccessScreen({super.key, this.isOnlyContinue = false});
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
              alignment: Alignment.topCenter,
              child: SvgPicture.asset(
                Assets.images.successRechargeTopBg,
                width: Constants.screenWidth(context),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                Assets.images.transfertBg,
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
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 82,
                          height: 82,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF18BC7A),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x7518BC7A),
                                blurRadius: 11,
                                offset: Offset(0, 14),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const Icon(
                            FontAwesomeIcons.check,
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
                    // width: 256,
                    child: Text(
                      _topNavBarController.loaderProvider.value == "transfert"
                          ? "Transfert reussi"
                          : _formController.isRechargeBottomSheet.value
                              ? 'Recharge reussie'
                              : "Retrait reussi",
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle(
                        color: const Color(0xFF18BC7A),
                        size: 30,
                        weight: FontWeight.w500,
                        height: 0.9,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 69.0, right: 69.0, bottom: 16.0),
                  // width: 256,
                  // height: 45,
                  child: Text(
                    _topNavBarController.loaderProvider.value == "transfert"
                        ? "Transfert éffectué avec succès, merci pour la confiance"
                        : _formController.isRechargeBottomSheet.value
                            ? 'Votre compte Sekure a été rechargé avec succes, merci pour la confiance.'
                            : 'Votre compte Sekure a été débité avec succes, merci pour la confiance.',
                    textAlign: TextAlign.center,
                    style: AppStyles.textPoppinsStyle(
                      color: AppColors.dark,
                      size: 12,
                      weight: FontWeight.w300,
                      height: 0.9,
                    ),
                  ),
                ),
                _formController.isAccountRecharge.value
                    ? GestureDetector(
                        onTap: () async {
                          _topNavBarController.setPageIndex(0);
                          Get.off(() => MainScreen());
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Container(
                                color: Colors.transparent,
                                child: LoadingAnimationWidget.inkDrop(
                                  color: AppColors.primary,
                                  size: 50,
                                ),
                              );
                            },
                          );

                          await _transactionController
                              .getTransactions(localUser);
                          if (_transactionController.transactions != null &&
                              _transactionController.transactions!.isNotEmpty) {
                            Get.back();
                          }
                          // Get.off(MainScreen());
                          Get.rawSnackbar(
                              backgroundColor: AppColors.dark,
                              borderRadius: 10.0,
                              // colorText: AppColors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              margin: const EdgeInsets.only(
                                  bottom: 40.0, left: 22.0, right: 22.0),
                              messageText: Center(
                                child: Text(
                                  'votre solde sera actualisé dans quelques minutes',
                                  style: AppStyles.textStyle(
                                    color: Colors.white,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0));
                        },
                        child: Container(
                          // width: double.infinity,
                          margin:
                              const EdgeInsets.only(left: 90.0, right: 90.0),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF18BC7A),
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
                                'Continuer',
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
                      )
                    : GestureDetector(
                        onTap: () async {
                          _topNavBarController.setPageIndex(0);
                          Get.off(() => MainScreen());

                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: false,
                          //   builder: (context) {
                          //     return Container(
                          //       color: Colors.transparent,
                          //       child: LoadingAnimationWidget.inkDrop(
                          //         color: AppColors.primary,
                          //         size: 50,
                          //       ),
                          //     );
                          //   },
                          // );

                          // await _transactionController
                          //     .getTransactions(localUser);
                          // if (_transactionController.transactions != null &&
                          //     _transactionController.transactions!.isNotEmpty) {
                          //   Get.back();
                          // }
                          // Get.off(MainScreen());
                        },
                        child: Container(
                          // width: double.infinity,
                          margin:
                              const EdgeInsets.only(left: 90.0, right: 90.0),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF18BC7A),
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
                                "Retour a l'accueil",
                                style: AppStyles.textPoppinsStyle(
                                  color: AppColors.white,
                                  size: 13,
                                  weight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                !_formController.isAccountRecharge.value
                    ? GestureDetector(
                        onTap: () async {
                          _topNavBarController.pageIndex(3);
                          // _topNavBarController.scrollController.jumpTo(0);
                          Get.off(() => MainScreen());
                          _transactionController.onInit();

                          // showDialog(
                          //   context: context,
                          //   barrierDismissible: false,
                          //   builder: (context) {
                          //     return Container(
                          //       color: Colors.transparent,
                          //       child: LoadingAnimationWidget.inkDrop(
                          //         color: AppColors.primary,
                          //         size: 50,
                          //       ),
                          //     );
                          //   },
                          // );

                          // await _transactionController
                          //     .getTransactions(localUser);
                          // if (_transactionController.transactions != null &&
                          //     _transactionController.transactions!.isNotEmpty) {
                          //   Get.back();
                          // }
                          // Get.off(MainScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11.0),
                          child: Container(
                            // width: double.infinity,
                            margin:
                                const EdgeInsets.only(left: 88.0, right: 88.0),
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF4EFE3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                            ),
                            child: const Center(
                              child: FittedBox(
                                child: Text(
                                  'voir historique',
                                  style: TextStyle(
                                    color: Color(0xFF18BC7A),
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
                    : const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
