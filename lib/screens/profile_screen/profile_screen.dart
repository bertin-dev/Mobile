// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/profile_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/faq_screen/faq_screen.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/service_screen/service_screen.dart';
import 'package:secure_app/screens/update_profile_screen/update_profile_screen.dart';
import 'package:secure_app/screens/update_profile_screen/update_user_password_screen.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _profileController = Get.put(ProfileController());

  final UserController _userController = Get.put(UserController());
  final FormController _formController = Get.put(FormController());

  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  _launchURL(urlLink) async {
    final Uri url = Uri.parse(urlLink);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    _userController.isProfileExist(localUser.photo!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _userController.isProfileExist(localUser.photo!);
    return WillPopScope(
      onWillPop: () async {
        _topNavBarController.setPageIndex(0);
        Get.offAll(const MainScreen());
        return false;
      },
      child: NotificationListener<ScrollNotification>(
        onNotification: (Notification notification) {
          _userController.isProfileExist(localUser.photo!);
          return true;
        },
        child: Scaffold(
          backgroundColor: AppColors.imputBg,
          body: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  if (_profileController.isLanguageBottomSheetShow.value) {
                    _profileController.isLanguageBottomSheetShow(false);
                  } else if (_profileController.isLogOutBottomSheetShow.value) {
                    _profileController.isLogOutBottomSheetShow(false);
                  }
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, right: 22.0, bottom: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: GestureDetector(
                            onTap: () {
                              _topNavBarController.setPageIndex(0);
                              Get.offAll(const MainScreen());
                            },
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: AppColors.dark,
                              // size: 25.0,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 61.0),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.only(bottom: 23.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.dark,
                                        borderRadius:
                                            BorderRadius.circular(27.0)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.images.profileHeaderBg,
                                          width: Constants.screenWidth(context),
                                        ),
                                        SizedBox(
                                          width:
                                              Constants.screenWidth(context) /
                                                  1.5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Column(
                                              children: [
                                                localUser.name!
                                                            .split(" ")
                                                            .length >
                                                        2
                                                    ? Text(
                                                        "${localUser.name!.split(" ")[0].capitalize!} ${localUser.name!.split(" ")[1].capitalize!}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyles.textStyle(
                                                            color:
                                                                AppColors.white,
                                                            size: Constants
                                                                    .screenWidth(
                                                                        context) *
                                                                0.07,
                                                            weight:
                                                                FontWeight.w700,
                                                            height: 0.9),
                                                      )
                                                    : localUser.name!
                                                                .split(" ")
                                                                .length >
                                                            1
                                                        ? Text(
                                                            localUser.name!
                                                                .split(" ")[0]
                                                                .capitalize!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyles.textStyle(
                                                                color: AppColors
                                                                    .white,
                                                                size: Constants
                                                                        .screenWidth(
                                                                            context) *
                                                                    0.07,
                                                                weight:
                                                                    FontWeight
                                                                        .w700,
                                                                height: 0.9),
                                                          )
                                                        : const SizedBox(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    localUser.name!
                                                                .split(" ")
                                                                .length >
                                                            1
                                                        ? Text(
                                                            localUser.name!
                                                                .split(" ")
                                                                .last,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyles.textStyle(
                                                                color: AppColors
                                                                    .white,
                                                                size: Constants
                                                                        .screenWidth(
                                                                            context) *
                                                                    0.07,
                                                                weight:
                                                                    FontWeight
                                                                        .w700,
                                                                height: 0.9),
                                                          )
                                                        : Text(
                                                            localUser.name!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: AppStyles.textStyle(
                                                                color: AppColors
                                                                    .white,
                                                                size: Constants
                                                                        .screenWidth(
                                                                            context) *
                                                                    0.07,
                                                                weight:
                                                                    FontWeight
                                                                        .w700,
                                                                height: 0.9),
                                                          ),
                                                    const SizedBox(width: 3.0),
                                                    SvgPicture.asset(
                                                        Assets.icons.certify)
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 11.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "+237 ${localUser.phone}",
                                                style:
                                                    AppStyles.textPoppinsStyle(
                                                  color: AppColors.white,
                                                  size: 11.0,
                                                  weight: FontWeight.w700,
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 12.0, right: 7.0),
                                                child: Icon(
                                                  FontAwesomeIcons.locationDot,
                                                  color: AppColors.white,
                                                  size: 12.0,
                                                ),
                                              ),
                                              Text(
                                                localUser.city != null &&
                                                        localUser
                                                            .city!.isNotEmpty
                                                    ? "Cameroun, ${localUser.city}"
                                                        .capitalize!
                                                    : "Cameroun, yaoundé",
                                                style: AppStyles.textStyle(
                                                  color: AppColors.white,
                                                  size: 12.0,
                                                  weight: FontWeight.w700,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => UpdateProfileScreen());
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 70.0),
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        32.0)),
                                            child: Text(
                                              "Voir profil",
                                              // "Modifier profil",
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle(
                                                color: AppColors.dark,
                                                size: 16.0,
                                                weight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Stack(
                                    children: [
                                      Obx(() {
                                        return _userController
                                                    .isProfileImageExist
                                                    .value &&
                                                localUser.photo != null &&
                                                localUser.photo!.isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(54),
                                                child: Image.network(
                                                  localUser.photo!,
                                                  width: 150.0,
                                                  fit: BoxFit.contain,
                                                  // loadingBuilder: (context, child,
                                                  //     loadingProgress) {
                                                  //   return Container(
                                                  //     color: Colors.transparent,
                                                  //     child: LoadingAnimationWidget
                                                  //         .inkDrop(
                                                  //       color: AppColors.primary,
                                                  //       size: 50,
                                                  //     ),
                                                  //   );
                                                  // },
                                                ),
                                              )
                                            : Container(
                                                // width: 130, //174
                                                // height: 174, //174
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 29.0,
                                                        horizontal: 36.0),
                                                decoration: BoxDecoration(
                                                  color: AppColors.bgColor,
                                                  borderRadius:
                                                      BorderRadius.circular(64),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color(0x26000000),
                                                      blurRadius: 42,
                                                      offset: Offset(0, 4),
                                                      spreadRadius: 0,
                                                    )
                                                  ],
                                                ),
                                                child: SvgPicture.asset(
                                                  Assets.icons.sekureUser,
                                                  fit: BoxFit.fill,
                                                ),
                                                // child: ClipRRect(
                                                //   borderRadius: BorderRadius.circular(39),
                                                //   child: Image.asset(
                                                //     Assets.images.userProfile.path,
                                                //     fit: BoxFit.fill,
                                                //   ),
                                                // ),
                                              );
                                      }),
                                      Positioned(
                                        right: 18.0,
                                        bottom: 18.0,
                                        child: GestureDetector(
                                          onTap: () async {
                                            _userController.profilePicture =
                                                await _formController
                                                    .getOneImage(
                                                        isCamera: false);
                                            if (_userController
                                                    .profilePicture !=
                                                null) {
                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder: (context) {
                                                  return Container(
                                                    color: Colors.transparent,
                                                    child:
                                                        LoadingAnimationWidget
                                                            .inkDrop(
                                                      color: AppColors.primary,
                                                      size: 50,
                                                    ),
                                                  );
                                                },
                                              );
                                              print(_userController
                                                  .profilePicture!.value.path);
                                              print(_userController
                                                  .profilePicture!.value.name);
                                              print(_userController
                                                  .profilePicture!
                                                  .value
                                                  .mimeType);

                                              File img = File(_userController
                                                  .profilePicture!.value.path);
                                              await _userController
                                                  .updateProfilePicture(
                                                      img.path);
                                              Get.back();
                                              // print(img.)
                                              if (_userController
                                                  .err.isNotEmpty) {
                                                Constants.snackBar(
                                                    bgColor: AppColors.red,
                                                    textColor: AppColors.white,
                                                    description: _userController
                                                        .err.value);
                                              } else {
                                                setState(() {});

                                                Constants.snackBar(
                                                  bgColor: AppColors.primary,
                                                  textColor: AppColors.white,
                                                  description:
                                                      "Photo mise a jour avec succes",
                                                );
                                              }
                                              // }
                                            }
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                              color: AppColors.primary,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              FontAwesomeIcons.camera,
                                              size: 18.0,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 13.0),
                              padding: const EdgeInsets.only(
                                  left: 27.0,
                                  right: 27.0,
                                  top: 21.0,
                                  bottom: 14.0),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(13.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gagnez de l’argent en invitant vos amis",
                                    textAlign: TextAlign.center,
                                    style: AppStyles.textStyle(
                                        color: AppColors.dark,
                                        size: 23.0,
                                        weight: FontWeight.w700,
                                        height: 0.9),
                                  ),
                                  const InputLabel(
                                      label: "Mon code de reference",
                                      paddingTop: 14.0),
                                  Container(
                                    padding: const EdgeInsets.all(14.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.imputBg,
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          localUser.sponsorshipCode != null &&
                                                  localUser.sponsorshipCode!
                                                      .isNotEmpty
                                              ? localUser.sponsorshipCode!
                                              : "",
                                          // : "skr-marie5587",
                                          style: AppStyles.textPoppinsStyle(
                                            color: AppColors.dark,
                                            size: 14.0,
                                            weight: FontWeight.w400,
                                          ),
                                        ),
                                        localUser.sponsorshipCode != null
                                            ? GestureDetector(
                                                onTap: () async {
                                                  await Clipboard.setData(
                                                      ClipboardData(
                                                          text: localUser
                                                              .sponsorshipCode!
                                                              .toString()));
                                                  Get.rawSnackbar(
                                                      backgroundColor:
                                                          AppColors.dark,
                                                      borderRadius: 10.0,
                                                      // colorText: AppColors.white,
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 40.0,
                                                              left: 22.0,
                                                              right: 22.0),
                                                      messageText: Center(
                                                        child: Text(
                                                          'copié',
                                                          style: AppStyles
                                                              .textStyle(
                                                            color: Colors.white,
                                                            size: 12,
                                                            weight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 10.0));
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0),
                                                  decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    'copier',
                                                    style: AppStyles
                                                        .textPoppinsStyle(
                                                      color: Colors.white,
                                                      size: 12,
                                                      weight: FontWeight.w700,
                                                      // height: 0.17,
                                                      // letterSpacing: -0.48,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : const SizedBox()
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 7.0, bottom: 11.0),
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "Vous recevez ",
                                          style: AppStyles.textStyle(
                                              color: AppColors.dark,
                                              size: 12.0,
                                              weight: FontWeight.w700)),
                                      TextSpan(
                                          text: "1 Fcfa ",
                                          style: AppStyles.textPoppinsStyle(
                                              color: AppColors.primary,
                                              size: 12.0,
                                              weight: FontWeight.w700)),
                                      TextSpan(
                                          text:
                                              "par personne à la création de leur premiere carte",
                                          style: AppStyles.textStyle(
                                              color: AppColors.dark,
                                              size: 12.0,
                                              weight: FontWeight.w700))
                                    ])),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 70.0, right: 70.0),
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.dark,
                                        borderRadius:
                                            BorderRadius.circular(32.0)),
                                    child: Text(
                                      "Inviter un ami",
                                      textAlign: TextAlign.center,
                                      style: AppStyles.textStyle(
                                        color: AppColors.white,
                                        size: 16.0,
                                        weight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 16.0),
                              padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 19.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(13.0)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Aide",
                                        style: AppStyles.textPoppinsStyle(
                                          color: AppColors.dark,
                                          size: 10.0,
                                          weight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {
                                        Get.to(() => ServiceScreen());
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.service,
                                                color: AppColors.primary,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 26.0),
                                                child: Text(
                                                  "Service client".capitalize!,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          Get.to(() => FAQScreen());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.question,
                                                  color: AppColors.primary,
                                                  width: 25.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 26.0),
                                                  child: Text(
                                                    "FAQ",
                                                    textAlign: TextAlign.center,
                                                    style: AppStyles.textStyle(
                                                      color: AppColors.dark,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Icon(
                                              FontAwesomeIcons.chevronRight,
                                              size: 20.0,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                            ),
                            Obx(() {
                              return Container(
                                margin: const EdgeInsets.only(top: 12.0),
                                padding: const EdgeInsets.only(
                                    left: 25.0,
                                    right: 19.0,
                                    top: 15.0,
                                    bottom: 15.0),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(13.0)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "Aide",
                                          style: AppStyles.textPoppinsStyle(
                                            color: AppColors.dark,
                                            size: 10.0,
                                            weight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Row(
                                      //       children: [
                                      //         SvgPicture.asset(
                                      //           Assets.icons.moon,
                                      //           color: AppColors.primary,
                                      //           width: 25.0,
                                      //         ),
                                      //         Padding(
                                      //           padding: const EdgeInsets.only(
                                      //               left: 26.0),
                                      //           child: Text(
                                      //             "dark mode".capitalize!,
                                      //             textAlign: TextAlign.center,
                                      //             style: AppStyles.textStyle(
                                      //               color: AppColors.dark,
                                      //               size: 14.0,
                                      //               weight: FontWeight.w500,
                                      //             ),
                                      //           ),
                                      //         )
                                      //       ],
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         Text(
                                      //           _profileController
                                      //                   .isDarkModeActivated.value
                                      //               ? "On".capitalize!
                                      //               : 'Off'.capitalize!,
                                      //           style: AppStyles.textPoppinsStyle(
                                      //             color: AppColors.dark,
                                      //             size: 12,
                                      //             weight: FontWeight.w400,
                                      //           ),
                                      //         ),
                                      //         const SizedBox(width: 3.0),
                                      //         CupertinoSwitch(
                                      //           value: _profileController
                                      //               .isDarkModeActivated.value,
                                      //           onChanged: (bool? value) {
                                      //             _profileController
                                      //                 .isDarkModeActivated(value);
                                      //           },
                                      //         ),
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0), //40.0
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.print,
                                                  color: AppColors.primary,
                                                  width: 25.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 26.0),
                                                  child: Text(
                                                    "Empreintes digitales"
                                                        .capitalize!,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyles.textStyle(
                                                      color: AppColors.dark,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  _profileController
                                                          .isFingerPrintVerificationActivated
                                                          .value
                                                      ? 'On'.capitalize!
                                                      : "Off".capitalize!,
                                                  style: AppStyles
                                                      .textPoppinsStyle(
                                                    color: AppColors.dark,
                                                    size: 12,
                                                    weight: FontWeight.w400,
                                                  ),
                                                ),
                                                const SizedBox(width: 3.0),
                                                CupertinoSwitch(
                                                  value: _profileController
                                                      .isFingerPrintVerificationActivated
                                                      .value,
                                                  onChanged: (bool? value) {
                                                    _profileController
                                                        .isFingerPrintVerificationActivated(
                                                            value);
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 40.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onTap: () {
                                            _profileController
                                                .isLanguageBottomSheetShow(
                                                    true);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.icons.language,
                                                    color: AppColors.primary,
                                                    width: 25.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 26.0),
                                                    child: Text(
                                                      "Langue".capitalize!,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          AppStyles.textStyle(
                                                        color: AppColors.dark,
                                                        size: 14.0,
                                                        weight: FontWeight.w500,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    _profileController
                                                        .selectedLanguage
                                                        .value
                                                        .capitalize!,
                                                    style: AppStyles
                                                        .textPoppinsStyle(
                                                      color: AppColors.dark,
                                                      size: 12,
                                                      weight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 35.96),
                                                  const Icon(
                                                    FontAwesomeIcons
                                                        .chevronRight,
                                                    size: 20.0,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                              );
                            }),
                            Container(
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 19.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(13.0)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Mon Compte".capitalize!,
                                        style: AppStyles.textPoppinsStyle(
                                          color: AppColors.dark,
                                          size: 10.0,
                                          weight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.password,
                                              color: AppColors.primary,
                                              width: 20.0,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 26.0),
                                              child: GestureDetector(
                                                onTap: () => Get.to(() =>
                                                    UpdateUserPasswordScreen()),
                                                child: Text(
                                                  "Mot de passe".capitalize!,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.chevronRight,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.certify,
                                                // color: AppColors.primary,
                                                width: 25.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 22.0),
                                                child: Text(
                                                  "Vérification",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles
                                                      .textPoppinsStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7.0,
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                color: AppColors.primary
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        30.0)),
                                            child: Text(
                                              "vérifié",
                                              style: AppStyles.textStyle(
                                                  color: AppColors.primary,
                                                  size: 13.0,
                                                  weight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.security,
                                                // color: AppColors.primary,
                                                width: 20.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 26.0),
                                                child: GestureDetector(
                                                  onTap: () => setState(() {
                                                    launchUrl(
                                                      Uri.parse(
                                                        "https://www.getsekure.com/politique-de-confidentialite",
                                                      ),
                                                      mode: LaunchMode
                                                          .externalApplication,
                                                    );
                                                  }),
                                                  child: Text(
                                                    "Politique de confidentialité"
                                                        .capitalize!,
                                                    textAlign: TextAlign.center,
                                                    style: AppStyles.textStyle(
                                                      color: AppColors.dark,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.cachet,
                                                // color: AppColors.primary,
                                                width: 20.0,
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 26.0),
                                                  child: GestureDetector(
                                                    onTap: () => setState(() {
                                                      launchUrl(
                                                        Uri.parse(
                                                          "https://www.getsekure.com/conditions-generales-d-utilisation",
                                                        ),
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }),
                                                    child: Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: 'Termes ',
                                                            style: AppStyles
                                                                .textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 14,
                                                              weight: FontWeight
                                                                  .w500,
                                                              // height: 0.9,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: '&',
                                                            style: AppStyles
                                                                .textPoppinsStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 14,
                                                              weight: FontWeight
                                                                  .w500,
                                                              // height: 0.9,
                                                              // letterSpacing: -0.12,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: ' Conditions',
                                                            style: AppStyles
                                                                .textStyle(
                                                              color: AppColors
                                                                  .dark,
                                                              size: 14,
                                                              weight: FontWeight
                                                                  .w500,
                                                              // height: 0.9,
                                                              // letterSpacing: -0.12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                  // Text(
                                                  //     "termes & conditions".capitalize!,
                                                  //     textAlign: TextAlign.center,
                                                  //     style: AppStyles.textPoppinsStyle(
                                                  //       color: AppColors.dark,
                                                  //       size: 15.0,
                                                  //       weight: FontWeight.w500,
                                                  //     ),
                                                  //   ),
                                                  )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 12.0),
                              padding: const EdgeInsets.only(
                                  left: 25.0,
                                  right: 19.0,
                                  top: 10.0,
                                  bottom: 15.0),
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(13.0)),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                        "Plus".capitalize!,
                                        style: AppStyles.textPoppinsStyle(
                                          color: AppColors.dark,
                                          size: 10.0,
                                          weight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      onTap: () {
                                        _profileController
                                            .isLogOutBottomSheetShow(true);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.logout,
                                                color: AppColors.primary,
                                                width: 20.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 26.0),
                                                child: Text(
                                                  "déconnexion".capitalize!,
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 40.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.icons.circle,
                                                color: AppColors.primary,
                                                width: 25.0,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 26.0),
                                                child: Text(
                                                  "Mise à Jour",
                                                  textAlign: TextAlign.center,
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const Icon(
                                            FontAwesomeIcons.chevronRight,
                                            size: 20.0,
                                          )
                                        ],
                                      ),
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                "Version 1.0",
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle(
                                  color: AppColors.dark,
                                  size: 14.0,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _profileController
                                    .isDeleteAccountBottomSheetShow(true);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 12.0),
                                padding: const EdgeInsets.only(
                                    left: 25.0,
                                    right: 19.0,
                                    top: 15.0,
                                    bottom: 15.0),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(13.0)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                    FontAwesomeIcons.circleInfo,
                                                    color: AppColors.red),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 26.0),
                                                  child: Text(
                                                    "Supprimer mon compte",
                                                    textAlign: TextAlign.center,
                                                    style: AppStyles.textStyle(
                                                      color: AppColors.red,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const Icon(
                                              FontAwesomeIcons.chevronRight,
                                              size: 20.0,
                                              color: AppColors.red,
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Obx(() {
                return _profileController.isLogOutBottomSheetShow.value ||
                        _profileController.isLanguageBottomSheetShow.value ||
                        _profileController.isDeleteAccountBottomSheetShow.value
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: IntrinsicHeight(
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 32.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 50.0),
                            decoration: const BoxDecoration(
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 24,
                                    offset: Offset(0, -12),
                                    spreadRadius: 0,
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(26.0),
                                    topRight: Radius.circular(26.0))),
                            child: _profileController
                                    .isLogOutBottomSheetShow.value
                                ? Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18.0),
                                        child: Text(
                                          "Se Déconnecter ?",
                                          textAlign: TextAlign.center,
                                          style: AppStyles.textStyle(
                                            color: AppColors.dark,
                                            size: 27.0,
                                            weight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              _userController.logoutUser();

                                              // Get.off(() => LoginScreen());
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                  color: AppColors.dark,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0)),
                                              child: Text(
                                                "Continuer",
                                                textAlign: TextAlign.center,
                                                style: AppStyles.textStyle(
                                                  color: AppColors.white,
                                                  size: 16.0,
                                                  weight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 30.0),
                                          GestureDetector(
                                            onTap: () {
                                              _profileController
                                                  .isLogOutBottomSheetShow(
                                                      false);
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0,
                                                      horizontal: 20.0),
                                              decoration: BoxDecoration(
                                                  color: AppColors.imputBg,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          32.0)),
                                              child: Text(
                                                "Annuler",
                                                textAlign: TextAlign.center,
                                                style: AppStyles.textStyle(
                                                  color: AppColors.dark,
                                                  size: 16.0,
                                                  weight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : _profileController
                                        .isLanguageBottomSheetShow.value
                                    ? Column(
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            onTap: () {
                                              _profileController
                                                  .selectedLanguage("Français");
                                              _profileController
                                                  .isLanguageBottomSheetShow(
                                                      false);
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "FR",
                                                  style: AppStyles.textStyle(
                                                    color:
                                                        AppColors.chatDateColor,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(width: 21.0),
                                                Text(
                                                  "Français",
                                                  style: AppStyles.textStyle(
                                                    color: AppColors.dark,
                                                    size: 14.0,
                                                    weight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 21.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              onTap: () {
                                                _profileController
                                                    .selectedLanguage(
                                                        "Anglais");
                                                _profileController
                                                    .isLanguageBottomSheetShow(
                                                        false);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "EN",
                                                    style: AppStyles.textStyle(
                                                      color: AppColors
                                                          .chatDateColor,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 21.0),
                                                  Text(
                                                    "Anglais",
                                                    style: AppStyles.textStyle(
                                                      color: AppColors.dark,
                                                      size: 14.0,
                                                      weight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : _profileController
                                            .isDeleteAccountBottomSheetShow
                                            .value
                                        ? Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                        "Supprimer votre compte ?",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            AppStyles.textStyle(
                                                          color: AppColors.red,
                                                          size: 27.0,
                                                          weight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 18.0),
                                                      child: Text(
                                                        "En supprimant votre compte vos informations seront éffaceée et vous n'aurez plus acces a nos services",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: AppStyles
                                                            .textPoppinsStyle(
                                                          color: AppColors.red,
                                                          size: 13.0,
                                                          weight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        barrierDismissible:
                                                            false,
                                                        builder: (context) {
                                                          return Container(
                                                            color: Colors
                                                                .transparent,
                                                            child:
                                                                LoadingAnimationWidget
                                                                    .inkDrop(
                                                              color: AppColors
                                                                  .primary,
                                                              size: 50,
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      _userController
                                                          .deleteUser()
                                                          .then((value) {
                                                        Get.back();
                                                        if (_userController
                                                            .err.isEmpty) {
                                                          _userController
                                                              .logoutUser();
                                                        } else {
                                                          Constants.snackBar(
                                                              bgColor:
                                                                  AppColors.red,
                                                              textColor:
                                                                  AppColors
                                                                      .white,
                                                              description:
                                                                  _userController
                                                                      .err
                                                                      .value);
                                                        }
                                                      });

                                                      // Get.off(() => LoginScreen());
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 15.0,
                                                          horizontal: 20.0),
                                                      decoration: BoxDecoration(
                                                          color: AppColors.dark,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      32.0)),
                                                      child: Text(
                                                        "Continuer",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            AppStyles.textStyle(
                                                          color:
                                                              AppColors.white,
                                                          size: 16.0,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 30.0),
                                                  GestureDetector(
                                                    onTap: () {
                                                      _profileController
                                                          .isDeleteAccountBottomSheetShow(
                                                              false);
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 15.0,
                                                          horizontal: 20.0),
                                                      decoration: BoxDecoration(
                                                          color:
                                                              AppColors.imputBg,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      32.0)),
                                                      child: Text(
                                                        "Annuler",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            AppStyles.textStyle(
                                                          color: AppColors.dark,
                                                          size: 16.0,
                                                          weight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                          ),
                        ),
                      )
                    : const SizedBox();
              })
            ],
          ),
        ),
      ),
    );
  }
}
