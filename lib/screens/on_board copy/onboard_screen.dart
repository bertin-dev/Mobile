import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/on_board_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/screens/register_screen/register_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({super.key});
  final OnBoardController _onBoardController = Get.put(OnBoardController());
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  final PageController _controller = PageController();
  Widget pages(
      {required String title,
      required String subtitle,
      required String imagePath,
      required BuildContext context}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: Constants.screenWidth(context) / 1.4,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                      color: AppColors.dark,
                      size: 25.0,
                      height: 0.9,
                      weight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
              child: SizedBox(
                width: Constants.screenWidth(context) / 1.4,
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: AppStyles.textPoppinsStyle(
                      color: AppColors.dark,
                      size: 11.0,
                      weight: FontWeight.w300),
                ),
              ),
            ),
            Obx(() {
              return _onBoardController.pageIndex.value == 0
                  ? GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                        _onBoardController.setPageIndex(1);
                      },
                      child: Container(
                        height: 38.0,
                        width: 38.0,
                        decoration: const BoxDecoration(
                            color: AppColors.dark, shape: BoxShape.circle),
                        child: const Icon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.white,
                          size: 10.0,
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_onBoardController.pageIndex.value > 0) {
                              _controller.previousPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                              _onBoardController.setPageIndex(
                                  _onBoardController.pageIndex.value - 1);
                            }
                          },
                          child: Container(
                            height: 38.0,
                            width: 38.0,
                            // padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                                color: AppColors.grey, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.chevronLeft,
                                color: AppColors.white,
                                size: 10.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        GestureDetector(
                          onTap: () {
                            if (_onBoardController.pageIndex.value < 2) {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                              _onBoardController.setPageIndex(2);
                            } else {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut);
                              _onBoardController.setPageIndex(3);
                            }
                          },
                          child: Container(
                            height: 38.0, width: 38.0,
                            // padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                                color: AppColors.dark, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.chevronRight,
                                color: AppColors.white,
                                size: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            }),
          ],
        ),

        Obx(
          () {
            return _onBoardController.pageIndex.value < 2
                ? Flexible(
                    child: Center(
                        // height: double.infinity,
                        // width: Constants.screenWidth(context) / 1.2,
                        child: SizedBox(
                      width: double.infinity,
                      // height: Constants.screenHeight(context),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        // width: 20.0,
                      ),
                    )),
                  )
                : Flexible(
                    child: Stack(
                      children: [
                        // Container(
                        //     // height: double.infinity,
                        //     // width: double.infinity,
                        //     child: SvgPicture.asset(
                        //   Assets.images.bgDesign,
                        //   fit: BoxFit.cover,
                        // )),
                        SizedBox(
                          // height: double.infinity,
                          // height: Constants.screenHeight(context),
                          width: double.infinity,
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        )
        // Stack(
        //   children: [
        //     // Container(
        //     //     // height: double.infinity,
        //     //     width: double.infinity,
        //     //     child: SvgPicture.asset(
        //     //       Assets.images.bgDesign,
        //     //       fit: BoxFit.cover,
        //     //     )),
        //     Container(
        //         // height: double.infinity,
        //         width: double.infinity,
        //         child: Image.asset(
        //           imagePath,
        //           fit: BoxFit.cover,
        //         )),
        //   ],
        // )
      ],
    );
  }

  Widget lastPage({
    required BuildContext context,
  }) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        // height: Constants.screenHeight(context) / 2.3,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: Constants.screenWidth(context) / 1.4,
                    child: Text(
                      "Une Sécurité robuste et de classe mondiale",
                      textAlign: TextAlign.center,
                      style: AppStyles.textPoppinsStyle(
                          color: AppColors.dark,
                          size: 25.0,
                          height: 0.9,
                          weight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 8.0, bottom: 5.0),
                  child: SizedBox(
                    width: Constants.screenWidth(context) / 1.4,
                    child: Text(
                      "C'est votre argent, nous vous aidons simplement à le gérer. Ne nous croyez pas seulement sur parole , commencer maintenant.",
                      textAlign: TextAlign.center,
                      style: AppStyles.textPoppinsStyle(
                          color: AppColors.dark,
                          size: 11.0,
                          weight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                      _onBoardController.setPageIndex(2);
                    },
                    child: Container(
                      height: 38.0,
                      width: 38.0,
                      // padding: const EdgeInsets.all(16.0),
                      decoration: const BoxDecoration(
                          color: AppColors.grey, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: AppColors.white,
                          size: 10.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _userController.resetLoginData();
                          _formController.resetFormErrors();
                          Get.offAll(RegisterScreen()); //FIXME: Put Get.to...
                        },
                        child: const PrimaryButton(
                          textButton: "créer mon compte",
                          buttonColor: AppColors.dark,
                          hasIcon: true,
                          circleIconColor: AppColors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 19.0),
                        child: GestureDetector(
                          onTap: () {
                            _userController.resetLoginData();
                            _formController.resetFormErrors();
                            Get.offAll(LoginScreen()); //FIXME: Put Get.to...
                          },
                          child: const PrimaryButton(
                            textButton: "je veux me connecter",
                            buttonColor: AppColors.white,
                            iconColor: AppColors.white,
                            textColor: AppColors.dark,
                            hasBorder: true,
                            hasIcon: true,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // Expanded(
      // height: double.infinity,
      // width: double.infinity,
      // child:
      Flexible(
        child: SizedBox(
            width: double.infinity,
            // height: Constants.screenHeight(context) / 2,
            child: SvgPicture.asset(
              Assets.images.bgDesignBottom,
              fit: BoxFit.cover,
              // ),
            )),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 89.0),
        child: PageView(
          controller: _controller,
          onPageChanged: (int index) {
            _onBoardController.setPageIndex(index);
          },
          children: [
            pages(
              title: "Payer en ligne va devenir facile",
              subtitle:
                  "Des cartes Visa et Mastercard stables qui redéfinissent votre manière de payer",
              // "Demandez et effectuez des paiements dans le monde entier ; obtenez des cartes virtuelles Visa/Mastercard; Dépensez votre argent librement dans une seule application.",
              imagePath: Assets.images.phonePng.path,
              context: context,
            ),
            pages(
              title: "Recharger tes cartes aux taux les plus bas du dollars",
              subtitle:
                  "Obtenez jusqu'à 6 cartes bancaires virtuelles, recharger et dépenser aux taux les plus bas du marché.",
              imagePath: Assets.images.moneyPng.path,
              context: context,
            ),
            pages(
              title: "Transferer de l’argent partout en Afrique",
              subtitle:
                  "Transférer instantanément et gratuitement de l'argent à ceux qui comptent le plus pour vous à travers l'Afrique.",
              imagePath: Assets.images.personsPng.path,
              context: context,
            ),
            lastPage(context: context),
          ],
        ),
      ),
    );
  }
}
