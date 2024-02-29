import 'package:dots_indicator/dots_indicator.dart';
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
import 'package:slide_to_act/slide_to_act.dart';

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
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          if (_onBoardController.pageIndex.value > 0) {
            _onBoardController.pageIndex--;
          }
        } else if (details.velocity.pixelsPerSecond.dx < 0) {
          if (_onBoardController.pageIndex.value < 2) {
            _onBoardController.pageIndex.value++;
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        // padding: const EdgeInsets.only(
        //     top: 16.0, bottom: 16.0, right: 16.0, left: 16.0),
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Image.asset(
                //       Assets.icons.appIcon.path,
                //       color: AppColors.white,
                //       // width: 50.0,
                //     ),
                //     Text(
                //       "Skip",
                //       style: AppStyles.textStyle(
                //           color: AppColors.white, weight: FontWeight.w500),
                //     ),
                //   ],
                // ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      stops: [0.2, 1],
                      colors: [AppColors.primary, Colors.transparent])),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      stops: [0.5, 1],
                      colors: [AppColors.primary, Colors.transparent])),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Assets.icons.appIcon.path,
                        color: AppColors.white,
                        // width: 50.0,
                      ),
                      Text(
                        "Skip",
                        style: AppStyles.textStyle(
                            color: AppColors.white, weight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DotsIndicator(
                          dotsCount: 3,
                          position: _onBoardController.pageIndex.value,
                          decorator: DotsDecorator(
                            color: AppColors.grey300,
                            activeColor: AppColors.white,
                            size: const Size.square(10.0),
                            activeSize: const Size(50.0, 10.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        ),
                        SizedBox(
                          height: Constants.screenHeight(context) / 15,
                        ),
                        SizedBox(
                          width: Constants.screenWidth(context) / 1.4,
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: AppStyles.textPoppinsStyle(
                                color: AppColors.white,
                                size: 25.0,
                                height: 0.9,
                                weight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 15.0, bottom: 5.0),
                          child: SizedBox(
                            width: Constants.screenWidth(context) / 1.4,
                            child: Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: AppStyles.textPoppinsStyle(
                                  color: AppColors.white,
                                  size: 11.0,
                                  weight: FontWeight.w300),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 20.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _userController.resetLoginData();
                                  _formController.resetFormErrors();
                                  Get.offAll(
                                      RegisterScreen()); //FIXME: Put Get.to...
                                },
                                child: const PrimaryButton(
                                  textButton: "créer mon compte",
                                  buttonColor: AppColors.primary,
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
                                    Get.offAll(
                                        LoginScreen()); //FIXME: Put Get.to...
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
                        )
                        // SlideAction(
                        //   borderRadius: 16,
                        //   elevation: 0,
                        //   height: 50.0,
                        //   submittedIcon: const Icon(
                        //     FontAwesomeIcons.check,
                        //     color: AppColors.white,
                        //   ),
                        //   sliderButtonIconPadding: 10.0,
                        //   // sliderButtonIconSize: 18.0,
                        //   innerColor: AppColors.primary,
                        //   outerColor: AppColors.brown,
                        //   sliderButtonIcon: const Icon(
                        //     FontAwesomeIcons.chevronRight,
                        //     color: AppColors.white,
                        //   ),
                        //   child: Padding(
                        //     padding:
                        //         const EdgeInsets.only(right: 10.0, left: 10.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         const SizedBox(),
                        //         Text("Swipe to start",
                        //             style: AppStyles.textStyle(
                        //                 color: AppColors.white,
                        //                 weight: FontWeight.w500)),
                        //         const Icon(
                        //           FontAwesomeIcons.angleDoubleRight,
                        //           size: 18.0,
                        //           color: AppColors.white,
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        //   // text: "Swipe to start",
                        //   // sliderRotate: false,
                        //   // textStyle: AppStyles.textStyle(
                        //   //   color: AppColors.white,
                        //   //   weight: FontWeight.w500,
                        //   // ),
                        //   onSubmit: () {
                        //     _userController.resetLoginData();
                        //     _formController.resetFormErrors();
                        //     return Get.offAll(RegisterScreen(),
                        //         duration: Duration(milliseconds: 700),
                        //         transition: Transition.cupertino);
                        //     //do something
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
        child: pages(
          title: "Payer en ligne va devenir facile",
          subtitle:
              "Des cartes Visa et Mastercard stables qui redéfinissent votre manière de payer",
          // "Demandez et effectuez des paiements dans le monde entier ; obtenez des cartes virtuelles Visa/Mastercard; Dépensez votre argent librement dans une seule application.",
          imagePath: _onBoardController.pageIndex.value == 0
              ? Assets.images.phonePng.path
              : _onBoardController.pageIndex.value == 1
                  ? Assets.images.moneyPng.path
                  : Assets.images.personsPng.path,
          context: context,
        ),
        //     PageView(
        //   controller: _controller,
        //   onPageChanged: (int index) {
        //     _onBoardController.setPageIndex(index);
        //   },
        //   children: [
        //     pages(
        //       title: "Payer en ligne va devenir facile",
        //       subtitle:
        //           "Des cartes Visa et Mastercard stables qui redéfinissent votre manière de payer",
        //       // "Demandez et effectuez des paiements dans le monde entier ; obtenez des cartes virtuelles Visa/Mastercard; Dépensez votre argent librement dans une seule application.",
        //       imagePath: Assets.images.phonePng.path,
        //       context: context,
        //     ),
        //     pages(
        //       title: "Recharger tes cartes aux taux les plus bas du dollars",
        //       subtitle:
        //           "Obtenez jusqu'à 6 cartes bancaires virtuelles, recharger et dépenser aux taux les plus bas du marché.",
        //       imagePath: Assets.images.moneyPng.path,
        //       context: context,
        //     ),
        //     pages(
        //       title: "Transferer de l’argent partout en Afrique",
        //       subtitle:
        //           "Transférer instantanément et gratuitement de l'argent à ceux qui comptent le plus pour vous à travers l'Afrique.",
        //       imagePath: Assets.images.personsPng.path,
        //       context: context,
        //     ),
        //     lastPage(context: context),
        //   ],
        // ),
      ),
    );
  }
}
