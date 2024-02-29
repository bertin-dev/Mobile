import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:keyboard_visibility_pro/keyboard_visibility_pro.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/user_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/screens/register_screen/components/terms_component.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return KeyboardVisibility(
        onChanged: (bool isVisible) {
          _formController.isKeyboardVisible(isVisible);
        },
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            surfaceTintColor: AppColors.white,
            elevation: 0.0,
            leading: GestureDetector(
                onTap: () {
                  _formController.isObscurePass(true);
                  _formController.isObscureCPass(true);
                  Get.offAll(() => LoginScreen());
                },
                child: const Icon(FontAwesomeIcons.arrowLeft)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(Assets.images.appIcon2SekurePng.path),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          const TextSpan(text: "S’inscrire sur "),
                          TextSpan(
                              text: "sekure",
                              style: AppStyles.textStyle(
                                  color: AppColors.primary,
                                  size: 25.0,
                                  weight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  InputLabel(
                    label: "Nom complet",
                    paddingTop: 19.0,
                  ),
                  InputField(
                    labelText: "",
                    hasIcon: false,
                    isElevated: false,
                    hasShadow: false,
                    contentPadding: 16.0,
                    icon: FontAwesomeIcons.a,
                    keyboardType: TextInputType.text,
                    iconColor: AppColors.dark,
                    value: _userController.name.value,
                    isNotRegularCaracter: true,
                    onChanged: (String value) {
                      _userController.name(value);
                      _formController.fieldVerification(
                        field: value,
                        isName: true,
                        errorCallback: (String error) =>
                            _formController.hasErrorOnName(error),
                      );
                    },
                  ),
                  _formController.hasErrorOnName.value.isNotEmpty
                      ? InputLabel(
                          label: _formController.hasErrorOnName.value,
                          paddingTop: 8.0,
                          color: AppColors.red,
                        )
                      : const SizedBox(),
                  InputLabel(
                    label: "Numero de telephone",
                    paddingTop: 19.0,
                  ),
                  InputField(
                    labelText: "",
                    hasIcon: false,
                    isElevated: false,
                    hasShadow: false,
                    contentPadding: 16.0,
                    isPhoneNumber: true,
                    isNotRegularCaracter: true,
                    icon: FontAwesomeIcons.a,
                    keyboardType: TextInputType.number,
                    iconColor: AppColors.dark,
                    hasSuffix: true,
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
                  InputLabel(
                    label: "Adresse mail",
                    paddingTop: 16.0,
                  ),
                  InputField(
                    labelText: "",
                    hasIcon: false,
                    isElevated: false,
                    hasShadow: false,
                    contentPadding: 16.0,
                    icon: FontAwesomeIcons.a,
                    keyboardType: TextInputType.text,
                    iconColor: AppColors.dark,
                    value: _userController.email.value,
                    isNotRegularCaracter: true,
                    onChanged: (String value) {
                      _userController.email(value);
                      _formController.fieldVerification(
                        field: value,
                        isEmail: true,
                        errorCallback: (String error) =>
                            _formController.hasErrorOnMail(error),
                      );
                    },
                  ),
                  _formController.hasErrorOnMail.value.isNotEmpty
                      ? InputLabel(
                          label: _formController.hasErrorOnMail.value,
                          paddingTop: 8.0,
                          hasSpecialCaraters: true,
                          color: AppColors.red,
                        )
                      : const SizedBox(),
                  InputLabel(
                    label: "Mot de passe",
                    paddingTop: 19.0,
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
                      isNotRegularCaracter: true,
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
                  InputLabel(
                    label: "Confirmation",
                    paddingTop: 19.0,
                  ),
                  Obx(() {
                    return InputField(
                      labelText: "",
                      hasIcon: false,
                      isElevated: false,
                      hasShadow: false,
                      hasSuffix: true,
                      obscureText: _formController.isObscureCPass.value,
                      hasMaxLine: true,
                      maxLine: 1,
                      contentPadding: 14.0,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _formController.isObscureCPass.value =
                                !_formController.isObscureCPass.value;
                          },
                          child: _formController.isObscureCPass.value
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
                      value: _userController.cPassword.value,
                      isNotRegularCaracter: true,
                      onChanged: (String value) {
                        _userController.cPassword(value);
                        _formController.fieldVerification(
                          field: value,
                          isCpass: true,
                          pass: _userController.password.value,
                          errorCallback: (String error) =>
                              _formController.hasErrorOnCPassword(error),
                        );
                      },
                    );
                  }),
                  _formController.hasErrorOnCPassword.value.isNotEmpty
                      ? InputLabel(
                          label: _formController.hasErrorOnCPassword.value,
                          paddingTop: 8.0,
                          color: AppColors.red,
                        )
                      : const SizedBox(),
                  Obx(() {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        _formController.isPairainCodeVisible(
                            !_formController.isPairainCodeVisible.value);
                        print("object");
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InputLabel(
                              label: "ID de parrainage (facultatif)",
                              hasSpecialCaraters: true,
                              paddingTop: 19.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 19.0),
                              child: Icon(
                                _formController.isPairainCodeVisible.value
                                    ? FontAwesomeIcons.chevronDown
                                    : FontAwesomeIcons.chevronUp,
                                size: 14.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                  Obx(() {
                    return _formController.isPairainCodeVisible.value
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InputField(
                                  labelText: "",
                                  hasIcon: false,
                                  isElevated: false,
                                  hasShadow: false,
                                  isDoubleOnLine: true,
                                  contentPadding: 14.0,
                                  icon: FontAwesomeIcons.a,
                                  keyboardType: TextInputType.text,
                                  iconColor: AppColors.dark,
                                  value: "",
                                  isNotRegularCaracter: true,
                                  onChanged: (String value) {},
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Text(
                                  "Verifier",
                                  style: AppStyles.textStyle(
                                    color: AppColors.white,
                                    size: 14.0,
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox();
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.5),
                    child: Obx(() {
                      return TermsComponents(
                        termDescription:
                            "j’ai lu et accepté les termes et conditions de Sekure",
                        isTerms: true,
                        isChecked: _formController.isConditionsChecked.value,
                        onTap: () {
                          _formController.isConditionsChecked.value =
                              !_formController.isConditionsChecked.value;
                        },
                      );
                    }),
                  ),
                  Obx(() {
                    return TermsComponents(
                      termDescription:
                          "j’accepte de recevoir des messages d’information de Sekure",
                      isChecked: _formController.isMessageReceptionCheck.value,
                      onTap: () {
                        _formController.isMessageReceptionCheck.value =
                            !_formController.isMessageReceptionCheck.value;
                      },
                    );
                  }),
                  !_formController.isKeyboardVisible.value
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: 39.0, bottom: 19.0),
                          child: GestureDetector(
                            onTap: () async {
                              _formController.fieldVerification(
                                field: _userController.name.value,
                                isName: true,
                                errorCallback: (String error) =>
                                    _formController.hasErrorOnName(error),
                              );
                              _formController.fieldVerification(
                                field: _userController.email.value,
                                isEmail: true,
                                errorCallback: (String error) =>
                                    _formController.hasErrorOnMail(error),
                              );
                              _formController.fieldVerification(
                                field: _userController.phone.value,
                                isName: true,
                                errorCallback: (String error) =>
                                    _formController.hasErrorOnPhone(error),
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
                                    _formController.hasErrorOnCPassword(error),
                              );
                              // Get.to(MainScreen());
                              if (_formController.hasErrorOnName.isEmpty &&
                                  _formController.hasErrorOnMail.isEmpty &&
                                  _formController.hasErrorOnPhone.isEmpty &&
                                  _formController.hasErrorOnPassword.isEmpty &&
                                  _formController.hasErrorOnCPassword.isEmpty &&
                                  _formController.isConditionsChecked.value) {
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

                                final UserModel newUser = UserModel(
                                  name: _userController.name.trim(),
                                  email: _userController.email.trim(),
                                  phone: _userController.phone.trim(),
                                  role: "user",
                                  password: _userController.password.trim(),
                                  passwordConfirm:
                                      _userController.cPassword.trim(),
                                );
                                await _userController.registerUser(newUser);
                                Get.back();
                                if (_userController.err.isNotEmpty) {
                                  Constants.snackBar(
                                      bgColor: AppColors.red,
                                      textColor: AppColors.white,
                                      hasSpecialCharacters: true,
                                      description: _userController.err.value);
                                } else {
                                  Get.off(MainScreen());
                                  _formController.isObscurePass(true);
                                  _formController.isObscureCPass(true);
                                  // _formController.isAccountVerified(false); //TODO: uncomment this
                                  _userController.resetLoginData();
                                  _formController.resetFormErrors();
                                }
                              } else if (!_formController
                                  .isConditionsChecked.value) {
                                Constants.snackBar(
                                    bgColor: AppColors.red,
                                    textColor: AppColors.white,
                                    hasSpecialCharacters: true,
                                    description:
                                        "Veuillez accepeter les termes et conditions");
                              } else {}
                            },
                            child: const PrimaryButton(
                              textButton: "créer mon compte",
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
                            _formController.isObscureCPass(true);
                            _userController.resetLoginData();
                            _formController.resetFormErrors();
                            Get.off(LoginScreen());
                          },
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 33.0),
                            child: Text(
                              "J’ai déjà un compte",
                              textAlign: TextAlign.center,
                              style: AppStyles.textStyle(
                                  //TODO: Change the font to poppins
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
      );
    });
  }
}
