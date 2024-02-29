import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_field_widget.dart';
import 'package:secure_app/widgets/input_label.dart';

class EnterInfosScreen extends StatelessWidget {
  EnterInfosScreen({super.key});
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
            'Mot de passe oublié',
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 25,
              weight: FontWeight.w700,
              // height: 0.9,
            ),
          ),
          Text(
            'Nous verifions votre identité avant de vous permettre de\n changer de mot de passe',
            style: AppStyles.textStyle(
              color: Colors.white,
              size: 12,
              weight: FontWeight.w400,
              // height: 0.9,
            ),
          ),
          InputLabel(
            label: "Nom complet",
            paddingTop: 25.0,
            color: AppColors.white,
          ),
          InputField(
            labelText: "Ma**************an",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            isNotRegularCaracter: true,
            contentPadding: 16.0,
            icon: FontAwesomeIcons.a,
            keyboardType: TextInputType.text,
            iconColor: AppColors.dark,
            inputBg: AppColors.otpFieldBg,
            textColor: AppColors.white,
            value: _userController.name.value,
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
            paddingTop: 15.0,
            color: AppColors.white,
          ),
          InputField(
            labelText: "65******2",
            hasIcon: false,
            isElevated: false,
            hasShadow: false,
            hasSuffix: true,
            isNotRegularCaracter: true,
            isPhoneNumber: true,
            contentPadding: 16.0,
            inputBg: AppColors.otpFieldBg,
            textColor: AppColors.white,
            suffixIcon: Image.asset(Assets.icons.cmrFlag.path),
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
        ],
      );
    });
  }
}
