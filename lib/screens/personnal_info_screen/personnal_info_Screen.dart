import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/personnal_info_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/screens/personnal_info_screen/carrier_and_id_info_screen.dart';
import 'package:secure_app/screens/personnal_info_screen/personnal_data_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';

class PersonnalInfoScreen extends StatelessWidget {
  PersonnalInfoScreen({super.key});
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
        // appBar: AppBar(
        //   backgroundColor: AppColors.white,
        //   surfaceTintColor: AppColors.white,
        //   elevation: 0.0,
        //   leading: const Icon(FontAwesomeIcons.arrowLeft),
        // ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: Constants.screenHeight(context),
            child: Stack(
              children: [
                // SizedBox(
                //   height: double.infinity,
                //   width: double.infinity,
                //   child: SvgPicture.asset(
                //     Assets.images.backgroundW,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 22.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_personnalInfoController.pageIndex.value == 0) {
                        Get.back();
                      } else {
                        _personnalInfoController.setPageIndex(0);
                      }
                    },
                    child: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      // size: 25.0,
                    ),
                  ),
                )
                    //     Padding(
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
                    ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 80.0, left: 22.0, right: 22.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Informations personnelles",
                              style: AppStyles.textStyle(
                                  color: AppColors.dark,
                                  size: 20.0,
                                  weight: FontWeight.w600),
                            ),
                            // page1()
                            Obx(() {
                              return _personnalInfoController.pageIndex.value ==
                                      0
                                  ? PersonalDataScreen()
                                  : CarrierAndIdInfoScreen();
                            })
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
                                  onTap: () async {
                                    if (_personnalInfoController
                                            .pageIndex.value ==
                                        0) {
                                      _formController.fieldVerification(
                                        field: _userController.country.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnCountry(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.city.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnCity(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.adress.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnAdress(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.birthday.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnBirthday(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.sexe.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnSexe(error),
                                      );
                                      if (_formController
                                              .hasErrorOnCountry.isEmpty &&
                                          _formController
                                              .hasErrorOnCity.isEmpty &&
                                          _formController
                                              .hasErrorOnAdress.isEmpty &&
                                          _formController
                                              .hasErrorOnBirthday.isEmpty &&
                                          _formController
                                              .hasErrorOnSexe.isEmpty) {
                                        _personnalInfoController
                                            .setPageIndex(1);
                                      }
                                    } else {
                                      _formController.fieldVerification(
                                        field: _userController.profession.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnProfession(error),
                                      );
                                      _formController.fieldVerification(
                                        field:
                                            _userController.meanIncomes.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnMeanIncomes(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.idType.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnIDType(error),
                                      );
                                      _formController.fieldVerification(
                                        field: _userController.idNumber.value,
                                        isName: true,
                                        errorCallback: (String error) =>
                                            _formController
                                                .hasErrorOnIDNumber(error),
                                      );
                                      if (_formController
                                              .hasErrorOnProfession.isEmpty &&
                                          _formController
                                              .hasErrorOnMeanIncomes.isEmpty &&
                                          _formController
                                              .hasErrorOnIDType.isEmpty &&
                                          _formController
                                              .hasErrorOnIDNumber.isEmpty) {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (context) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: AppColors.primary,
                                                size: 50,
                                              ),
                                            );
                                          },
                                        );
                                        final UserModel currentUser = UserModel(
                                          name: localUser.name,
                                          email: localUser.email,
                                          country: _userController.country
                                              .trim()
                                              .toLowerCase(),
                                          city: _userController.city.trim(),
                                          // city: _userController.city
                                          //     .trim()
                                          //     .toLowerCase(),
                                          address:
                                              _userController.adress.trim(),
                                          birthday:
                                              _userController.birthday.trim(),
                                          sex: _userController.sexe
                                              .trim()
                                              .toLowerCase(),
                                          job: _userController.profession
                                              .trim()
                                              .toLowerCase(),
                                          income: _userController.meanIncomes
                                              .trim(),
                                          idPaper: _userController.idType
                                              .trim()
                                              .toLowerCase(),
                                          idNumber:
                                              _userController.idNumber.trim(),
                                        );
                                        await _userController
                                            .updateCurrentUser(currentUser);
                                        Get.back();
                                        if (_userController.err.isNotEmpty) {
                                          Constants.snackBar(
                                              bgColor: AppColors.red,
                                              textColor: AppColors.white,
                                              hasSpecialCharacters: true,
                                              description:
                                                  _userController.err.value);
                                        } else {
                                          Get.to(AccountVerificationScreen());
                                          _formController
                                              .isPersonalInfosverified(true);
                                          _personnalInfoController
                                              .setPageIndex(0);
                                        }
                                      }
                                    }
                                  },
                                  child: PrimaryButton(
                                    textButton: _personnalInfoController
                                                .pageIndex.value ==
                                            0
                                        ? "Continuer"
                                        : "Valider",
                                    buttonColor: AppColors.dark,
                                    hasIcon: false,
                                    circleIconColor: AppColors.white,
                                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
