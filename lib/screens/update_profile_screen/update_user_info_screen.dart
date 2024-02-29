import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/personnal_info_controller.dart';
import 'package:secure_app/controllers/profile_controller.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/mail_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/mail_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_verification_screen.dart';
import 'package:secure_app/screens/update_profile_screen/update_profile_screen.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

class UpdateUserInfoScreen extends StatelessWidget {
  UpdateUserInfoScreen({super.key});
  final PersonnalInfoController _personnalInfoController =
      Get.put(PersonnalInfoController());
  final ProfileController _personnalController = Get.put(ProfileController());
  final FormController _formController = Get.put(FormController());
  // final TopNavBarController _topNavBarController =
  //     Get.put(TopNavBarController());

  // List<String> countryList = ["Cameroun"];
  // List<String> cityList = ["Douala", "Yaounde", "Baffoussam"];
  // List<String> genderList = ["Masculin", "Feminin"];
  // List<String> professionList = ["Etudiant", "Travailleur"];
  // List<String> incomesMean = [
  //   "0-1000\$ / mois",
  //   "1000-5000\$ / mois",
  //   "5000-100000\$ / mois"
  // ];
  // List<String> identificationDocumentList = [
  //   "Récépissé",
  //   "CNI",
  //   "Permis de conduire",
  //   "Passeport"
  // ];

  Widget updatePersonnalInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: "Nom complet", paddingTop: 13.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.name!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        ),
        // InputField(
        //   labelText: "",
        //   hasIcon: false,
        //   isElevated: false,
        //   hasShadow: false,
        //   hasSuffix: false,
        //   contentPadding: 16.0,
        //   // isPhoneNumber: true,
        //   icon: FontAwesomeIcons.a,
        //   keyboardType: TextInputType.text,
        //   iconColor: AppColors.dark,
        //   value: "",
        //   onChanged: (String value) {},
        // ),
        InputLabel(label: "Date de naissance", paddingTop: 13.0),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.birthday!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        ),
        // GestureDetector(
        //     onTap: () async {
        //       final DateTime? picked = await showDatePicker(
        //           fieldHintText: "Choissez une date",
        //           locale: const Locale('fr'),
        //           fieldLabelText: "Date",
        //           context: context,
        //           initialDate: DateTime.now(),
        //           firstDate: DateTime(1920),
        //           lastDate: DateTime.now());
        //       print(picked);
        //       if (picked != null &&
        //           picked.toString() != _formController.birthDayDate.value) {
        //         _formController
        //             .birthDayDate(DateFormat('dd-MM-yyyy').format(picked));
        //       }
        //     },
        //     child: Container(
        //       width: double.infinity,
        //       padding: EdgeInsets.symmetric(
        //           vertical: _formController.birthDayDate.value.isNotEmpty
        //               ? 18.0
        //               : 25.0,
        //           horizontal: 12.0),
        //       decoration: BoxDecoration(
        //           color: AppColors.imputBg,
        //           borderRadius: BorderRadius.circular(5.0)),
        //       child: Text(
        //         _formController.birthDayDate.value,
        //         style: AppStyles.textPoppinsStyle(
        //             color: AppColors.dark, size: 12.0),
        //       ),
        //     )),
        InputLabel(label: "Sexe", paddingTop: 13.0),
        // DropDownComponent(
        //   hasIcon: false,
        //   fieldLabel: "Sexe",
        //   itemsList: genderList,
        //   onChanged: (String? value) {},
        // )
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.sex!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        )
      ],
    );
  }

  Widget updateLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputLabel(label: "Pays d origine", paddingTop: 13.0),
        // DropDownComponent(
        //   hasIcon: true,
        //   fieldLabel: "Pays d origine",
        //   itemsList: countryList,
        //   onChanged: (String? value) {},
        // ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.country!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        ),
        InputLabel(label: "Ville", paddingTop: 13.0),
        // DropDownComponent(
        //   hasIcon: false,
        //   fieldLabel: "Ville",
        //   itemsList: cityList,
        //   onChanged: (String? value) {},
        // ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.city!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        ),
        InputLabel(label: "Adresse", paddingTop: 13.0),
        // InputField(
        //   labelText: "",
        //   hasIcon: false,
        //   isElevated: false,
        //   hasShadow: false,
        //   hasSuffix: false,
        //   contentPadding: 16.0,
        //   // isPhoneNumber: true,
        //   icon: FontAwesomeIcons.a,
        //   keyboardType: TextInputType.text,
        //   iconColor: AppColors.dark,
        //   value: "",
        //   onChanged: (String value) {},
        // ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
          decoration: BoxDecoration(
              color: AppColors.imputBg,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            localUser.address!,
            style:
                AppStyles.textPoppinsStyle(color: AppColors.dark, size: 12.0),
          ),
        )
      ],
    );
  }

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
        body: Stack(
          children: [
            SafeArea(
                child: GestureDetector(
              onTap: () {
                print("jdhsjahds");
                Get.off(() => UpdateProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 22.0),
                child: GestureDetector(
                    onTap: () {
                      print("jdhsjahds");
                      Get.off(() => UpdateProfileScreen());
                    },
                    child: const Icon(FontAwesomeIcons.arrowLeft, size: 27.0)),
              ),
            )),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 60.0, left: 22.0, right: 22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   "Informations personnelles",
                        //   style: AppStyles.textStyle(
                        //       color: AppColors.dark,
                        //       size: 20.0,
                        //       weight: FontWeight.w600),
                        // ),
                        // page1()
                        Obx(() {
                          return _personnalController
                                      .updateUserInfoProvider.value ==
                                  "personal"
                              ? updatePersonnalInfo(context)
                              : _personnalController
                                          .updateUserInfoProvider.value ==
                                      "location"
                                  ? updateLocation(context)
                                  : _personnalController
                                                  .updateUserInfoProvider.value ==
                                              "phone" &&
                                          !_formController
                                              .isPhoneOtpVerification.value
                                      ? PhoneVerificationStep()
                                      : _personnalController
                                                      .updateUserInfoProvider
                                                      .value ==
                                                  "phone" &&
                                              _formController.isPhoneOtpVerification
                                                  .value
                                          ? PhoneOtpVerificationStep()
                                          : _personnalController
                                                          .updateUserInfoProvider
                                                          .value ==
                                                      "mail" &&
                                                  _personnalController
                                                          .updateUserInfoProvider
                                                          .value ==
                                                      "mail" &&
                                                  !_formController
                                                      .isOtpVerification.value
                                              ? MailVerificationStep()
                                              : MailOtpVerificationStep();
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
                        padding: const EdgeInsets.only(left: 22.0, right: 22.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Constants.snackBar(
                                    bgColor: AppColors.dark,
                                    textColor: AppColors.white,
                                    description:
                                        "Veuillez contacter le support");
                                // if (_personnalController
                                //             .updateUserInfoProvider.value ==
                                //         "phone" &&
                                //     !_formController
                                //         .isPhoneOtpVerification.value) {
                                //   _formController.isPhoneOtpVerification(true);
                                // } else if (_personnalController
                                //             .updateUserInfoProvider.value ==
                                //         "mail" &&
                                //     !_formController.isOtpVerification.value) {
                                //   _formController.isOtpVerification(true);
                                // } else {
                                //   Get.off(() => UpdateProfileScreen());
                                // }
                              },
                              child: PrimaryButton(
                                textButton:
                                    // _personnalController
                                    //                     .updateUserInfoProvider
                                    //                     .value ==
                                    //                 "mail" &&
                                    //             !_formController
                                    //                 .isOtpVerification.value ||
                                    //         _personnalController
                                    //                     .updateUserInfoProvider
                                    //                     .value ==
                                    //                 "phone" &&
                                    //             !_formController
                                    //                 .isPhoneOtpVerification.value
                                    //     ? "Suivant"
                                    //     :
                                    "Modifier",
                                buttonColor: _personnalController
                                                    .updateUserInfoProvider
                                                    .value ==
                                                "mail" &&
                                            !_formController
                                                .isOtpVerification.value ||
                                        _personnalController
                                                    .updateUserInfoProvider
                                                    .value ==
                                                "phone" &&
                                            !_formController
                                                .isPhoneOtpVerification.value
                                    ? AppColors.dark
                                    : AppColors.primary,
                                hasIcon: true,
                                circleIconColor: AppColors.white,
                                iconColor: AppColors.primary,
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(top: 13.0),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       Get.off(() => UpdateProfileScreen());
                            //     },
                            //     child: const PrimaryButton(
                            //       textButton: "Annuler",
                            //       buttonColor: AppColors.imputBg,
                            //       textColor: AppColors.dark,
                            //       hasIcon: false,
                            //       circleIconColor: AppColors.white,
                            //     ),
                            //   ),
                            // ),
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
    );
  }
}
