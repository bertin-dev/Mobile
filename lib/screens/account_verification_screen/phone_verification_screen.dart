import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/input_label.dart';
import 'package:secure_app/widgets/input_field_widget.dart';

class PhoneVerificationStep extends StatelessWidget {
  PhoneVerificationStep({super.key});
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
                      'Verification Numéro',
                      style: AppStyles.textStyle(
                        color: const Color(0xFF0F0F0F),
                        size: 20,
                        weight: FontWeight.w600,
                        // height: 0.09,
                      ),
                    ),
                  ))
              : const SizedBox(),
          InputLabel(
            label: "Numero de telephone",
            paddingTop: 15.0,
          ),
          localUser.isProfileVerified != null && localUser.isProfileVerified!
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 14.0),
                  decoration: BoxDecoration(
                      color: AppColors.imputBg,
                      borderRadius: BorderRadius.circular(5.0)),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "237 ",
                              style: AppStyles.textPoppinsStyle(
                                  color: AppColors.dark,
                                  size: 12.0,
                                  weight: FontWeight.w700),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 12.0),
                              child: Icon(FontAwesomeIcons.chevronDown,
                                  size: 12.0),
                            ),
                            Text(
                              localUser.phone!,
                              style: AppStyles.textPoppinsStyle(
                                  color: AppColors.dark, size: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(Assets.icons.cmrFlag.path),
                            // const SizedBox(width: 6.0),
                            // Image.asset(Assets.icons.orange.path),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InputField(
                    labelText:
                        localUser.phone != null && localUser.phone!.isNotEmpty
                            ? localUser.phone!
                            : "65******2",
                    hasIcon: false,
                    isElevated: false,
                    hasShadow: false,
                    hasSuffix: true,
                    isPhoneNumber: true,
                    maxLine: 1,
                    hasMaxLine: true,
                    inputBg: AppColors.imputBg,
                    // contentPadding: 16.0,
                    suffixIcon: IntrinsicWidth(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(Assets.icons.cmrFlag.path),
                          // const SizedBox(width: 6.0),
                          // Image.asset(Assets.icons.orange.path),
                        ],
                      ),
                    ),
                    icon: FontAwesomeIcons.a,
                    keyboardType: TextInputType.number,
                    iconColor: AppColors.dark,
                    value:
                        localUser.phone != null && localUser.phone!.isNotEmpty
                            ? localUser.phone!
                            : _userController.phone.value,
                    isNotRegularCaracter: true,
                    onChanged: (String value) {
                      _userController.phone(value);
                      _formController.fieldVerification(
                        field: value,
                        isPhoneNumber: true,
                        pass: _userController.phone.value,
                        errorCallback: (String error) =>
                            _formController.hasErrorOnPhone(error),
                      );
                    },
                  ),
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
