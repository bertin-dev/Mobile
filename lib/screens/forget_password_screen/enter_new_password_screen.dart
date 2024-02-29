import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class EnterNewPasswordScreen extends StatelessWidget {
  EnterNewPasswordScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nouveau mot de passe',
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 25,
              weight: FontWeight.w700,
              // height: 0.9,
            ),
          ),
          Text(
            "entrez votre nouveau mot de passe, pensez à le garder cette fois",
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 12,
              weight: FontWeight.w400,
              // height: 0.9,
            ),
          ),
          const SizedBox(height: 33.0),
          InputLabel(
            label: "Mot de passe",
            paddingTop: 15.0,
            color: AppColors.white,
          ),
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
            inputBg: AppColors.otpFieldBg,
            textColor: AppColors.white,
            contentPadding: 14.0,
            suffixIcon: GestureDetector(
                onTap: () {
                  _formController.isObscurePass.value =
                      !_formController.isObscurePass.value;
                },
                child: _formController.isObscurePass.value
                    ? const Icon(
                        FontAwesomeIcons.eye,
                        color: AppColors.white,
                        size: 18.0,
                      )
                    : const Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: AppColors.white,
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
          InputLabel(
            label: "Confirmation",
            paddingTop: 15.0,
            color: AppColors.white,
          ),
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
              inputBg: AppColors.otpFieldBg,
              textColor: AppColors.white,
              contentPadding: 14.0,
              suffixIcon: GestureDetector(
                  onTap: () {
                    _formController.isObscurePass.value =
                        !_formController.isObscurePass.value;
                  },
                  child: _formController.isObscurePass.value
                      ? const Icon(
                          FontAwesomeIcons.eye,
                          color: AppColors.white,
                          size: 18.0,
                        )
                      : const Icon(
                          FontAwesomeIcons.eyeSlash,
                          color: AppColors.white,
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
}
