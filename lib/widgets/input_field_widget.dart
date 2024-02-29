import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class InputField extends StatelessWidget {
  InputField({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscureText,
    required this.keyboardType,
    required this.value,
    this.suffixIcon,
    this.hasSuffix = false,
    this.hasIcon = true,
    required this.iconColor,
    this.hasMaxLine = false,
    this.hasShadow = true,
    this.isElevated = true,
    this.hasBorder = false,
    this.hasErrorOnField = false,
    this.isPhoneNumber = false,
    this.isDoubleOnLine = false,
    this.isNotRegularCaracter = false,
    this.inputBg = AppColors.imputBg,
    this.textColor = AppColors.dark,
    this.maxLine = 7,
    this.contentPadding = 18.0,
    this.paddingRight = 20.0,
    this.maxLength,
    required this.onChanged,
    this.isHistorySearch = false,
  });

  final String labelText;
  final IconData? icon;
  final bool? obscureText;
  final bool hasSuffix;
  final bool hasIcon;
  final bool isNotRegularCaracter;
  final bool isPhoneNumber;
  final Color iconColor;
  final bool hasMaxLine;
  final bool hasShadow;
  final bool hasBorder;
  final bool isElevated;
  final bool hasErrorOnField;
  final Color inputBg;
  final Color textColor;
  final void Function(String) onChanged;
  final bool isDoubleOnLine;
  final double paddingRight;
  TextInputType keyboardType;
  Widget? suffixIcon;
  String value;
  int maxLine;
  int? maxLength;
  double contentPadding;
  bool isHistorySearch;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isDoubleOnLine ? Constants.screenWidth(context) / 2.6 : null,
      child: Material(
        elevation: isElevated ? 15.0 : 0.0,
        shadowColor: hasShadow ? Colors.grey[300] : null,
        shape: hasBorder
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                    color:
                        hasErrorOnField ? AppColors.primary : AppColors.white,
                    width: 1),
              )
            : null,
        borderRadius: !hasBorder ? BorderRadius.circular(8.0) : null,
        color: inputBg,
        child: Padding(
          padding: EdgeInsets.only(right: paddingRight, left: 15.0),
          child: Row(
            children: [
              isPhoneNumber
                  ? Material(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0)),
                      color: inputBg,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 11.5,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                "237",
                                style: AppStyles.textStyle(
                                    color: AppColors.chatFieldHint,
                                    weight: FontWeight.w700,
                                    size: 12.0),
                              ),
                            ),
                            const SizedBox(width: 2.0),
                            const Icon(
                              FontAwesomeIcons.chevronDown,
                              size: 12.0,
                              color: AppColors.chatFieldHint,
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: TextFormField(
                  maxLength: maxLength,

                  // focusNode:  _focusNode,
                  cursorColor: AppColors.primary,
                  initialValue: value,
                  style:
                      // isNotRegularCaracter
                      //     ?
                      AppStyles.textPoppinsStyle(
                    color: textColor,
                    size: 11,
                    weight: FontWeight.w400,
                    height: null,
                  ),
                  // : AppStyles.textStyle(
                  //     color: textColor, size: 12.0, height: null),
                  onChanged: onChanged,
                  obscureText: obscureText ?? false,
                  autofocus: false,
                  maxLines: hasMaxLine ? maxLine : null,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    counterText: "",
                    suffixIconConstraints: hasSuffix && !isHistorySearch ? const BoxConstraints(
                      minWidth: 16.0,
                      minHeight: 12.0,
                    ) : null,
                    suffixIcon: hasSuffix ? suffixIcon : null,
                    contentPadding: hasMaxLine
                        ? EdgeInsets.only(
                            bottom: hasSuffix ? contentPadding : 30.0,
                            top: 19.0)
                        : EdgeInsets.symmetric(vertical: contentPadding),
                    icon: hasIcon
                        ? Icon(
                            icon,
                            color: iconColor,
                            size: 16.67,
                          )
                        : null,
                    // labelStyle: AppStyles.textStyle(
                    //     color: AppColors.grey300, size: 17.0),
                    hintText: labelText,
                    hintStyle:
                        // isNotRegularCaracter
                        //     ?
                        AppStyles.textPoppinsStyle(
                      color: AppColors.chatFieldHint,
                      size: 12,
                      // weight: FontWeight.w400,
                      // height: 0.17,
                    ),
                    // : AppStyles.textStyle(
                    //     color: AppColors.chatFieldHint, size: 12.0),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
