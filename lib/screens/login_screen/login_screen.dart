// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/transaction_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/forget_password_screen/forget_password_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/register_screen/register_screen.dart';
import 'package:secure_app/widgets/input_label.dart';
// import 'package:secure_app/screens/register_screen/components/terms_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());
  final TransactionController _transactionController =
      Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return KeyboardVisibility(
        onChanged: (bool isVisible) {
          _formController.isKeyboardVisible(isVisible);
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          // appBar: AppBar(
          //   backgroundColor: AppColors.white,
          //   surfaceTintColor: AppColors.white,
          //   elevation: 0.0,
          //   leading: Icon(FontAwesomeIcons.arrowLeft),
          //   actions: [Image.asset(Assets.images.appName.path)],
          // ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Stack(
                    children: [
                      SizedBox(
                          width: double.infinity,
                          child: SvgPicture.asset(
                            Assets.images.bgDesignTop,
                            fit: BoxFit.cover,
                          )),
                      // Padding( //FIXME: Uncomment this
                      //   padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       _formController.isObscurePass(true);
                      //       _formController.isObscureCPass(true);
                      //       Get.back();
                      //       print("jhfdh");
                      //     },
                      //     child: const Icon(
                      //       FontAwesomeIcons.arrowLeft,
                      //       // size: 25.0,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: RichText(
                            text: TextSpan(
                              style: AppStyles.textStyle(
                                  color: AppColors.dark,
                                  size: 25.0,
                                  weight: FontWeight.w500),
                              children: [
                                const TextSpan(text: "Se connecter sur "),
                                TextSpan(
                                  text: "sekure",
                                  style: AppStyles.textStyle(
                                      color: AppColors.primary,
                                      size: 25.0,
                                      weight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const InputLabel(
                          label: "Numero de telephone",
                          paddingTop: 15.0,
                        ),
                        InputField(
                          labelText: "",
                          hasIcon: false,
                          isElevated: false,
                          hasShadow: false,
                          hasSuffix: true,
                          isPhoneNumber: true,
                          contentPadding: 16.0,
                            suffixIcon: IntrinsicWidth(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(Assets.icons.smallCmrFlag.path),
                                  // const SizedBox(width: 6.0),
                                  // Image.asset(Assets.icons.orange.path),
                                ],
                              ),
                            ),
                          icon: FontAwesomeIcons.a,
                          keyboardType: TextInputType.number,
                          iconColor: AppColors.dark,
                          value: _userController.phone.value,
                          onChanged: (String value) {
                            _userController.phone(value);
                            _formController.fieldVerification(
                              field: value,
                              isPhoneNumber: true,
                              errorCallback: (String error) =>
                                  _formController.hasErrorOnPhone(error),
                            );
                          },
                        ),
                        _formController.hasErrorOnPhone.value.isNotEmpty
                            ? InputLabel(
                                label: _formController.hasErrorOnPhone.value,
                                paddingTop: 8.0,
                                color: AppColors.red,
                              )
                            : const SizedBox(),
                        const InputLabel(
                          label: "Mot de passe",
                          paddingTop: 15.0,
                        ),
                        Obx(() {
                          return InputField(
                            labelText: "",
                            hasIcon: false,
                            isElevated: false,
                            hasShadow: false,
                            hasSuffix: true,
                            obscureText: _formController.isObscurePass.value,
                            hasMaxLine: true,
                            maxLine: 1,
                            contentPadding: 14.0,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  _formController.isObscurePass.value =
                                      !_formController.isObscurePass.value;
                                },
                                child: _formController.isObscurePass.value
                                    ? const Icon(
                                        FontAwesomeIcons.eye,
                                        size: 18.0,
                                      )
                                    : const Icon(
                                        FontAwesomeIcons.eyeSlash,
                                        size: 18.0,
                                      )),
                            icon: FontAwesomeIcons.a,
                            keyboardType: TextInputType.visiblePassword,
                            iconColor: AppColors.dark,
                            value: _userController.password.value,
                            onChanged: (String value) {
                              _userController.password(value);
                              _formController.fieldVerification(
                                field: value,
                                isPass: true,
                                errorCallback: (String error) =>
                                    _formController.hasErrorOnPassword(error),
                              );
                            },
                          );
                        }),
                        _formController.hasErrorOnPassword.value.isNotEmpty
                            ? InputLabel(
                                label: _formController.hasErrorOnPassword.value,
                                paddingTop: 8.0,
                                color: AppColors.red,
                              )
                            : const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  _formController.isObscurePass(true);
                                  _formController.otpScreenPageIndex(0);
                                  _userController.resetLoginData();
                                  _formController.resetFormErrors();
                                  Get.to(() => const ForgetPasswordScreen());
                                },
                                child: Text(
                                  'Mot de passe oublié?',
                                  style: AppStyles.textStyle(
                                    color: AppColors.primary,
                                    size: 12,
                                    weight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        !_formController.isKeyboardVisible.value
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 39.0, bottom: 19.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    _formController.fieldVerification(
                                      field: _userController.phone.value,
                                      isName: true,
                                      errorCallback: (String error) =>
                                          _formController
                                              .hasErrorOnPhone(error),
                                    );
                                    _formController.fieldVerification(
                                      field: _userController.password.value,
                                      isPass: true,
                                      errorCallback: (String error) =>
                                          _formController
                                              .hasErrorOnPassword(error),
                                    );
                                    // Get.to(MainScreen());
                                    if (_formController
                                            .hasErrorOnPhone.isEmpty &&
                                        _formController
                                            .hasErrorOnPassword.isEmpty) {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          return Container(
                                            color: Colors.transparent,
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: AppColors.primary,
                                              size: 50,
                                            ),
                                          );
                                        },
                                      );

                                      final UserModel newUser = UserModel(
                                        phone: _userController.phone.trim(),
                                        // "+237 ${_userController.phone.trim()}",
                                        password:
                                            _userController.password.trim(),
                                        notifToken:
                                            "a993fac3-00d8-49e0-bdf2-105fbd6e29c1",
                                        deviceType: "AndroidPush",
                                      );
                                      await _userController.loginUser(newUser);
                                      if (_userController.err.isNotEmpty) {
                                        Get.back();
                                        Constants.snackBar(
                                            bgColor: AppColors.red,
                                            textColor: AppColors.white,
                                            description:
                                                _userController.err.value);
                                      } else {
                                        print(_userController.user.value.token);
                                        // if ((localUser.token != null &&
                                        //         localUser.token!.isNotEmpty) ||
                                        //     (_userController.user.value.token !=
                                        //             null &&
                                        //         _userController.user.value
                                        //             .token!.isNotEmpty)) {
                                        // Get.back();
                                        // Navigator.of(context).pushReplacement(
                                        //     MaterialPageRoute(
                                        //         builder: (context) {
                                        //   return MainScreen();
                                        // }));
                                        // Get.(MainScreen());
                                        // _formController.isObscurePass(true);
                                        // _formController.isObscureCPass(true);
                                        // // _formController.isAccountVerified(true); //TODO: uncomment this
                                        // _userController.resetLoginData();
                                        // _formController.resetFormErrors();

                                        // showDialog(
                                        //   context: context,
                                        //   barrierDismissible: false,
                                        //   builder: (context) {
                                        //     return Container(
                                        //       color: Colors.transparent,
                                        //       child: LoadingAnimationWidget
                                        //           .inkDrop(
                                        //         color: AppColors.primary,
                                        //         size: 50,
                                        //       ),
                                        //     );
                                        //   },
                                        // );

                                        // await _transactionController
                                        //     .getTransactions(localUser);
                                        // if ((_transactionController
                                        //                 .transactions !=
                                        //             null &&
                                        //         _transactionController
                                        //             .transactions!.isNotEmpty) ||
                                        //     (_transactionController
                                        //                 .soldTransactions !=
                                        //             null &&
                                        //         _transactionController
                                        //             .soldTransactions!
                                        //             .isNotEmpty) ||
                                        //     (_transactionController
                                        //                 .transfertTransactions !=
                                        //             null &&
                                        //         _transactionController
                                        //             .transfertTransactions!
                                        //             .isNotEmpty)) {
                                        Get.back();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MainScreen()),
                                          (route) => false,
                                        );

                                        _formController.isObscurePass(true);
                                        _formController.isObscureCPass(true);
                                        // _formController.isAccountVerified(true); //TODO: uncomment this
                                        _userController.resetLoginData();
                                        _formController.resetFormErrors();
                                        // } else {
                                        //   Get.back();
                                        //   Constants.snackBar(
                                        //       bgColor: AppColors.red,
                                        //       textColor: AppColors.white,
                                        //       description:
                                        //           "Connexion internet instable reessayer");
                                        // }
                                        // } else {
                                        //   var transac =
                                        //       await _transactionController
                                        //           .getTransactions(
                                        //               _userController
                                        //                   .user.value);
                                        //   if (_transactionController
                                        //           .transactions !=
                                        //       null) {
                                        //     Get.back();
                                        //     Navigator.of(context)
                                        //         .pushReplacement(
                                        //             MaterialPageRoute(
                                        //                 builder: (context) {
                                        //       return MainScreen();
                                        //     }));
                                        //     // Get.(MainScreen());
                                        //     _formController.isObscurePass(true);
                                        //     _formController
                                        //         .isObscureCPass(true);
                                        //     // _formController.isAccountVerified(true); //TODO: uncomment this
                                        //     _userController.resetLoginData();
                                        //     _formController.resetFormErrors();
                                        //   }
                                        // }
                                      }
                                    } else {}
                                  },
                                  child: const PrimaryButton(
                                    textButton: "se connecter",
                                    buttonColor: AppColors.dark,
                                    hasIcon: true,
                                    circleIconColor: AppColors.white,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        !_formController.isKeyboardVisible.value
                            ? GestureDetector(
                                onTap: () {
                                  _formController.isObscurePass(true);
                                  Get.off(() => RegisterScreen());
                                  _userController.resetLoginData();
                                  _formController.resetFormErrors();
                                  // Get.off(RegisterScreen());
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 33.0),
                                  child: Text(
                                    "Je n' ai pas encore de compte",
                                    textAlign: TextAlign.center,
                                    style: AppStyles.textStyle(
                                        //TODO: Change font to poppins
                                        color: AppColors.dark,
                                        size: 12.0,
                                        weight: FontWeight.w500),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
