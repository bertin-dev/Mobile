import 'package:flutter/material.dart';
import 'package:secure_app/gen/fonts.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';

class AppStyles {
  static TextStyle textStyle(
          {required Color color,
          double size = 18.0,
          FontWeight weight = FontWeight.w400,
          double? height = 0,
          bool isUderLine = false,
          bool isItalic = false,
          double? letterSpacing,
          String? fontFamily}) =>
      TextStyle(
        fontFamily: fontFamily ?? FontFamily.lufga,
        color: color,
        fontSize: size,
        fontWeight: weight,
        height: height,
        decorationColor: AppColors.primary,
        decoration: isUderLine ? TextDecoration.underline : null,
        // leadingDistribution: TextLeadingDistribution.even,
        fontStyle: isItalic ? FontStyle.italic : null,
        letterSpacing: letterSpacing,
      );
  static TextStyle textPoppinsStyle(
          {required Color color,
          double size = 18.0,
          FontWeight weight = FontWeight.w400,
          double? height = 0,
          bool isUderLine = false,
          bool isItalic = false}) =>
      TextStyle(
        fontFamily: FontFamily.poppins,
        color: color,
        fontSize: size,
        fontWeight: weight,
        height: height,
        decorationColor: AppColors.primary,
        decoration: isUderLine ? TextDecoration.underline : null,
        // leadingDistribution: TextLeadingDistribution.even,
        fontStyle: isItalic ? FontStyle.italic : null,
      );
  // static TextStyle textBlackStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textBoldStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textSimpleStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textLightStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textMediumStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textRegularStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
  // static TextStyle textThinStyle(Color c, double size, bool isItalic) =>
  //     TextStyle(
  //       fontFamily: FontFamily.roboto,
  //       fontSize: size,
  //       fontWeight: FontWeight.w900,
  //       fontStyle: isItalic ? FontStyle.italic : null,
  //     );
}
