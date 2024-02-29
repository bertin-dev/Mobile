import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/personnal_info_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/screens/identity_verification_screen/identity_verification_loader.dart';
import 'package:secure_app/screens/identity_verification_screen/take_doc_picture_screen.dart';
import 'package:secure_app/screens/identity_verification_screen/take_selfie_picture_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/personnal_info_screen/components/resume_dropdown_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

class IdentityVerificationScreen extends StatelessWidget {
  IdentityVerificationScreen({super.key});
  final PersonnalInfoController _personnalInfoController =
      Get.put(PersonnalInfoController());
  final FormController _formController = Get.put(FormController());
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isVisible) {
        _personnalInfoController.isKeyboardVisible(isVisible);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 22.0),
            child: GestureDetector(
                onTap: () {
                  if (_personnalInfoController.pageIndex.value == 0) {
                    Get.back();
                  } else {
                    _personnalInfoController.setPageIndex(0);
                  }
                },
                child: const Icon(FontAwesomeIcons.arrowLeft, size: 27.0)),
          ),
        ),
        body: Obx(() {
          return Stack(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 30.0, left: 22.0),
              //   child: GestureDetector(
              //       onTap: () {
              //         if (_personnalInfoController.pageIndex.value == 0) {
              //           Get.back();
              //         } else {
              //           _personnalInfoController.setPageIndex(0);
              //         }
              //       },
              //       child: const Icon(FontAwesomeIcons.arrowLeft, size: 27.0)),
              // ),
              // SafeArea(
              //     child: Padding(
              //   padding: const EdgeInsets.only(top: 30.0, left: 22.0),
              //   child: GestureDetector(
              //       onTap: () {
              //         if (_personnalInfoController.pageIndex.value == 0) {
              //           Get.back();
              //         } else {
              //           _personnalInfoController.setPageIndex(0);
              //         }
              //       },
              //       child: const Icon(FontAwesomeIcons.arrowLeft, size: 27.0)),
              // )),
              SingleChildScrollView(
                controller: _topNavBarController.scrollController,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 22.0, right: 22.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _formController.identitificationPageIndex.value == 0
                              ? Text(
                                  "Presentez votre document d’identification",
                                  style: AppStyles.textStyle(
                                      color: AppColors.dark,
                                      size: 20.0,
                                      weight: FontWeight.w600),
                                )
                              : SizedBox(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Vous êtes à la fin, ',
                                          style: AppStyles.textStyle(
                                            color: Color(0xFF0F0F0F),
                                            size: 20,
                                            weight: FontWeight.w600,
                                            height: 0.9,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Prenez\n un selfie!!',
                                          style: AppStyles.textPoppinsStyle(
                                            color: AppColors.primary,
                                            size: 19,
                                            weight: FontWeight.w600,
                                            height: 0.9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                          // page1()
                          _formController.identitificationPageIndex.value == 0
                              ? TakeDocPictureScreen()
                              : TakeSelfiePictureScreen(),
                        ],
                      ),
                      _personnalInfoController.isKeyboardVisible.value
                          ? SizedBox(
                              height: Constants.screenHeight(context) / 25,
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              Obx(() {
                return !_personnalInfoController.isKeyboardVisible.value
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 22.0, right: 22.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (_formController
                                          .identitificationPageIndex.value ==
                                      0) {
                                    if ((_userController
                                            .cniRectoPath.value.isNotEmpty) &&
                                        ((_userController.idType.value
                                                        .toLowerCase() !=
                                                    "passeport" ||
                                                (localUser.idPaper != null &&
                                                    localUser.idPaper!
                                                            .toLowerCase() !=
                                                        "passeport")) &&
                                            (_userController.cniVersoPath.value
                                                .isNotEmpty))) {
                                      _formController
                                          .identitificationPageIndex(1);
                                    } else if ((_userController
                                            .cniRectoPath.value.isNotEmpty) &&
                                        (_userController.idType.value
                                                    .toLowerCase() ==
                                                "passeport" ||
                                            (localUser.idPaper == null &&
                                                localUser.idPaper!
                                                        .toLowerCase() !=
                                                    "passeport"))) {
                                      _formController
                                          .identitificationPageIndex(1);
                                    } else {
                                      Constants.snackBar(
                                          bgColor: AppColors.red,
                                          textColor: AppColors.white,
                                          hasSpecialCharacters: true,
                                          description: "Photo(s) manquante(s)");
                                      // if (_userController.cniRecto != null &&
                                      //     _userController
                                      //         .cniRecto!.value.path.isEmpty) {
                                      //   Constants.snackBar(
                                      //       bgColor: AppColors.red,
                                      //       textColor: AppColors.white,
                                      //       description:
                                      //           "Photo recto manquante");
                                      // } else if (_userController.cniVerso !=
                                      //         null &&
                                      //     _userController
                                      //         .cniVerso!.value.path.isEmpty) {
                                      //   Constants.snackBar(
                                      //       bgColor: AppColors.red,
                                      //       textColor: AppColors.white,
                                      //       description:
                                      //           "Photo verso manquante");
                                      // }
                                    }
                                  } else {
                                    if ((_userController
                                        .personImagePath.value.isNotEmpty)) {
                                      List<String> imagesPath = [
                                        // _userController.personImagePath.value,
                                        _userController.cniRectoPath.value,
                                        _userController.cniVersoPath.value
                                      ];
                                      Get.to(IdentityVerificationLoader(
                                          imgFilesPath: imagesPath));
                                    } else {
                                      Constants.snackBar(
                                          bgColor: AppColors.red,
                                          textColor: AppColors.white,
                                          description: "Selfie manquant");
                                    }
                                    // Get.to(AccountVerificationScreen());
                                    // _formController
                                    //     .isPersonalInfosverified(true);
                                  }
                                  print(_formController
                                      .identitificationPageIndex.value);
                                },
                                child: PrimaryButton(
                                    textButton: _formController
                                                .identitificationPageIndex
                                                .value ==
                                            0
                                        ? "Suivant"
                                        : "Me vérifier",
                                    buttonColor: AppColors.dark,
                                    hasIcon: _formController
                                                .identitificationPageIndex
                                                .value ==
                                            0
                                        ? false
                                        : true,
                                    circleIconColor: AppColors.white,
                                    hasBorder: false),
                              ),
                              SizedBox(
                                height: Constants.screenHeight(context) / 25,
                              )
                            ],
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
            ],
          );
        }),
      ),
    );
  }
}
