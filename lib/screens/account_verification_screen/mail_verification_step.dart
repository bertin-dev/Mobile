import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/input_field_widget.dart';

class MailVerificationStep extends StatelessWidget {
  MailVerificationStep({super.key});
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
          _formController.showTitleOnVerificationScreens.value
              ? Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    width: 332,
                    child: Text(
                      'Verification Mail',
                      style: AppStyles.textStyle(
                        color: const Color(0xFF0F0F0F),
                        size: 20,
                        weight: FontWeight.w600,
                        // height: 0.09,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          InputLabel(
            label: "Confirmez votre addresse mail",
            paddingTop: 15.0,
          ),
          localUser.isProfileVerified != null && localUser.isProfileVerified!
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                      color: AppColors.imputBg,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Text(
                    localUser.email!,
                    style: AppStyles.textPoppinsStyle(
                        color: AppColors.dark, size: 12.0),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InputField(
                    labelText:
                        localUser.email != null && localUser.email!.isNotEmpty
                            ? localUser.email!
                            : "hello@abc.de",
                    hasIcon: false,
                    isElevated: false,
                    hasShadow: false,
                    isNotRegularCaracter: true,
                    inputBg: AppColors.imputBg,
                    icon: FontAwesomeIcons.a,
                    keyboardType: TextInputType.text,
                    iconColor: AppColors.dark,
                    value:
                        localUser.email != null && localUser.email!.isNotEmpty
                            ? localUser.email!
                            : _userController.email.value,
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
                ),
          _formController.hasErrorOnMail.value.isNotEmpty
              ? InputLabel(
                  label: _formController.hasErrorOnMail.value,
                  paddingTop: 8.0,
                  color: AppColors.red,
                )
              : const SizedBox(),
        ],
      );
    });
  }
}
