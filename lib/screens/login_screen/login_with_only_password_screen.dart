import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:ui';

import '../../controllers/form_controller.dart';
import '../../controllers/user_controller.dart';
import '../../models/user_model.dart';
import '../../repositories/user_repository.dart';
import '../../ressources/app_colors.dart';
import '../../ressources/app_styles.dart';
import '../../ressources/constants.dart';
import '../../widgets/input_field_widget.dart';
import '../../widgets/input_label.dart';
import '../../widgets/primary_button.dart';
import '../main_screen/main_screen.dart';

class LoginWithOnlyPasswordScreen extends StatelessWidget {
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Obx(() {
      return KeyboardVisibility(
        onChanged: (bool isVisible) {
          _formController.isKeyboardVisible(isVisible);
        },
        child: SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0*fem, 21*fem, 0*fem, 21*fem),
                  width: double.infinity,
                  decoration: const BoxDecoration (
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(22*fem, 0*fem, 0*fem, 102*fem),
                        width: 18*fem,
                        height: 12*fem,
                        child: Image.asset(
                          'assets/images/vector-3.png',
                          width: 18*fem,
                          height: 12*fem,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 80.79*fem),
                        width: 401.13*fem,
                        height: 315.21*fem,
                        child: Image.asset(
                          'assets/images/group-809.png',
                          width: 401.13*fem,
                          height: 315.21*fem,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 0*fem, 10*fem),
                        padding: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
                        child: RichText(
                          text: TextSpan(
                            style: AppStyles.textStyle (
                              size: 25*ffem,
                              weight: FontWeight.w500,
                              height: 1.38*ffem/fem,
                              letterSpacing: -0.125*fem,
                              color: Color(0xff0f0f0f),
                            ),
                            children: [
                              TextSpan(
                                text: 'Bon retour sur ',
                                style: AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w600,
                                  height: 1.38*ffem/fem,
                                  letterSpacing: -0.125*fem,
                                  color: Color(0xff0f0f0f),
                                ),
                              ),
                              TextSpan(
                                text: 'Sekure',
                                style: AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w600,
                                  height: 1.38*ffem/fem,
                                  letterSpacing: -0.125*fem,
                                  color: Color(0xff18bc7a),
                                ),
                              ),
                              TextSpan(
                                text: '...',
                                style: AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w600,
                                  height: 1.38*ffem/fem,
                                  letterSpacing: -0.125*fem,
                                  color: Color(0xff0f0f0f),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
                        margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 22*fem, 0*fem),
                        width: double.infinity,
                        //height: 202.5*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(5*fem),
                        ),
                        child: Container(
                          width: double.infinity,
                          //height: double.infinity,
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(5*fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.5*fem),
                                child: Text(
                                  'Entrez votre Mot de passe pour acceder à votre compte',
                                  style: AppStyles.textStyle (
                                    size: 12*ffem,
                                    weight: FontWeight.w400,
                                    height: 1.3333333333*ffem/fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
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

                              !_formController.isKeyboardVisible.value
                                  ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 19.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    _formController.fieldVerification(
                                      field: _userController.password.value,
                                      isPass: true,
                                      errorCallback: (String error) =>
                                          _formController
                                              .hasErrorOnPassword(error),
                                    );
                                    // Get.to(MainScreen());
                                    if (_formController.hasErrorOnPassword.isEmpty) {
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
                                        phone: localUser.phone,
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
                                        Get.back();
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MainScreen()),
                                              (route) => false,
                                        );

                                        _formController.isObscurePass(true);
                                        _formController.isObscureCPass(true);
                                        // _formController.isAccountVerified(true); //TODO: uncomment this
                                        _userController.resetLoginData();
                                        _formController.resetFormErrors();
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
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
                        margin: EdgeInsets.fromLTRB(53*fem, 0*fem, 67*fem, 0*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // seconnecterparempreintedigital (1:205)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0*fem),
                              child: Text(
                                'se connecter par empreinte digitale',
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle (
                                  fontFamily: 'Poppins',
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: Color(0xff0f0f0f),
                                ),
                              ),
                            ),
                            Container(
                              // vectorG59 (1:206)
                              width: 19*fem,
                              height: 21*fem,
                              child: Image.asset(
                                'assets/images/vector-n91.png',
                                width: 19*fem,
                                height: 21*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}