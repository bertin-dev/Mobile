import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/personnal_info_controller.dart';
import 'package:secure_app/controllers/profile_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/account_verification_screen/mail_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/mail_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_otp_verification_step.dart';
import 'package:secure_app/screens/account_verification_screen/phone_verification_screen.dart';
import 'package:secure_app/screens/update_profile_screen/update_profile_screen.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/primary_button.dart';

class UpdateUserPasswordScreen extends StatefulWidget {
  UpdateUserPasswordScreen({super.key});

  @override
  State<UpdateUserPasswordScreen> createState() =>
      _UpdateUserPasswordScreenState();
}

class _UpdateUserPasswordScreenState extends State<UpdateUserPasswordScreen> {
  final PersonnalInfoController _personnalInfoController =
      Get.put(PersonnalInfoController());

  final ProfileController _personnalController = Get.put(ProfileController());

  final FormController _formController = Get.put(FormController());

  final UserController _userController = Get.put(UserController());

  Widget updatePasswordInfo(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputLabel(label: "Mot de passe actuel", paddingTop: 13.0),
          InputField(
            labelText: "••••••••••••",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: true,
            isNotRegularCaracter: true,
            obscureText: _formController.isObscureOldPass.value,
            hasMaxLine: true,
            maxLine: 1,
            inputBg: AppColors.imputBg,
            textColor: AppColors.dark,
            contentPadding: 14.0,
            suffixIcon: GestureDetector(
                onTap: () {
                  _formController.isObscureOldPass.value =
                      !_formController.isObscureOldPass.value;
                },
                child: _formController.isObscureOldPass.value
                    ? const Icon(
                        FontAwesomeIcons.eye,
                        color: AppColors.dark,
                        size: 18.0,
                      )
                    : const Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: AppColors.dark,
                        size: 18.0,
                      )),
            icon: FontAwesomeIcons.a,
            keyboardType: TextInputType.visiblePassword,
            iconColor: AppColors.dark,
            value: _userController.password.value,
            onChanged: (String value) {
              _userController.oldPassword(value);
              _formController.fieldVerification(
                field: value,
                isName: true,
                errorCallback: (String error) =>
                    _formController.hasErrorOnOldPassword(error),
              );
            },
          ),
          _formController.hasErrorOnOldPassword.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnOldPassword.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          const InputLabel(label: "Nouveau mot de passe", paddingTop: 13.0),
          InputField(
            labelText: "••••••••••••",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: true,
            isNotRegularCaracter: true,
            obscureText: _formController.isObscurePass.value,
            hasMaxLine: true,
            maxLine: 1,
            inputBg: AppColors.imputBg,
            textColor: AppColors.dark,
            contentPadding: 14.0,
            suffixIcon: GestureDetector(
                onTap: () {
                  _formController.isObscurePass.value =
                      !_formController.isObscurePass.value;
                },
                child: _formController.isObscurePass.value
                    ? const Icon(
                        FontAwesomeIcons.eye,
                        color: AppColors.dark,
                        size: 18.0,
                      )
                    : const Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: AppColors.dark,
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
          ),
          _formController.hasErrorOnPassword.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnPassword.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
          const InputLabel(
              label: "Confirmer nouveau mot de passe", paddingTop: 13.0),
          InputField(
              labelText: "••••••••••••",
              hasIcon: false,
              isElevated: false,
              hasShadow: false,
              hasSuffix: true,
              isNotRegularCaracter: true,
              obscureText: _formController.isObscureCPass.value,
              hasMaxLine: true,
              maxLine: 1,
              inputBg: AppColors.imputBg,
              textColor: AppColors.dark,
              contentPadding: 14.0,
              suffixIcon: GestureDetector(
                  onTap: () {
                    _formController.isObscureCPass.value =
                        !_formController.isObscureCPass.value;
                  },
                  child: _formController.isObscureCPass.value
                      ? const Icon(
                          FontAwesomeIcons.eye,
                          color: AppColors.dark,
                          size: 18.0,
                        )
                      : const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: AppColors.dark,
                          size: 18.0,
                        )),
              icon: FontAwesomeIcons.a,
              keyboardType: TextInputType.visiblePassword,
              iconColor: AppColors.dark,
              value: _userController.cPassword.value,
              onChanged: (String value) {
                _userController.cPassword(value);
                _formController.fieldVerification(
                  field: value,
                  isCpass: true,
                  pass: _userController.password.value,
                  errorCallback: (String error) =>
                      _formController.hasErrorOnCPassword(error),
                );
              }),
          _formController.hasErrorOnCPassword.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnCPassword.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
        ],
      );
    });
  }

  @override
  void initState() {
    _formController.hasErrorOnOldPassword("");
    _formController.hasErrorOnPassword("");
    _formController.hasErrorOnCPassword("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibility(
      onChanged: (bool isVisible) {
        _personnalInfoController.isKeyboardVisible(isVisible);
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            SafeArea(
                child: GestureDetector(
              onTap: () {
                Get.off(() => UpdateProfileScreen());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 22.0),
                child: GestureDetector(
                    onTap: () {
                      Get.back();
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
                    updatePasswordInfo(context),
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
                              onTap: () async {
                                _formController.fieldVerification(
                                  field: _userController.oldPassword.value,
                                  isName: true,
                                  errorCallback: (String error) =>
                                      _formController
                                          .hasErrorOnOldPassword(error),
                                );
                                _formController.fieldVerification(
                                  field: _userController.password.value,
                                  isPass: true,
                                  errorCallback: (String error) =>
                                      _formController.hasErrorOnPassword(error),
                                );
                                _formController.fieldVerification(
                                  field: _userController.cPassword.value,
                                  isCpass: true,
                                  pass: _userController.password.value,
                                  errorCallback: (String error) =>
                                      _formController
                                          .hasErrorOnCPassword(error),
                                );
                                if (_formController
                                        .hasErrorOnOldPassword.isEmpty &&
                                    _formController
                                        .hasErrorOnPassword.isEmpty &&
                                    _formController
                                        .hasErrorOnCPassword.isEmpty) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
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
                                  final Map<String, String> dataToSend = {
                                    "passwordCurrent":
                                        _userController.oldPassword.trim(),
                                    "password": _userController.password.trim(),
                                    "passwordConfirm":
                                        _userController.cPassword.trim()
                                  };
                                  await _userController
                                      .updatePassword(dataToSend);
                                  Get.back();
                                  if (_userController.err.isNotEmpty) {
                                    Constants.snackBar(
                                        bgColor: AppColors.red,
                                        textColor: AppColors.white,
                                        description: _userController.err.value);
                                  } else {
                                    _formController.isObscurePass(true);
                                    _formController.isObscureCPass(true);
                                    Get.back();
                                    _userController.resetLoginData();
                                    _formController.resetFormErrors();

                                    Constants.snackBar(
                                        bgColor: AppColors.primary,
                                        textColor: AppColors.white,
                                        description:
                                            "Mot de passe réinitialisé");
                                  }
                                }
                              },
                              child: const PrimaryButton(
                                textButton: "Mettre à jour",
                                buttonColor: AppColors.primary,
                                hasIcon: true,
                                circleIconColor: AppColors.white,
                                iconColor: AppColors.primary,
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
    );
  }
}
