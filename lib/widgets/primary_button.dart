import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String textButton;
  final bool hasIcon;
  final Color buttonColor;
  final Color circleIconColor;
  final Color iconColor;
  final Color textColor;
  final bool hasBorder;
  final double paddingleft;
  final double sizedBoxSizes;
  final double radius;
  final double? padding;
  final IconData icon;
  final Color? borderColor;
  const PrimaryButton(
      {super.key,
      required this.textButton,
      required this.buttonColor,
      this.circleIconColor = Colors.black,
      this.iconColor = Colors.black,
      this.textColor = Colors.white,
      this.paddingleft = 16.0,
      this.sizedBoxSizes = 38.0,
      this.radius = 50.0,
      required this.hasIcon,
      this.padding,
      this.icon = FontAwesomeIcons.chevronRight,
      this.hasBorder = false,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: !hasIcon ? double.infinity : null,
      padding: EdgeInsets.symmetric(vertical: hasIcon ? 11.0 : padding ?? 18.0),
      decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          border: hasBorder ? Border.all(color: borderColor ?? AppColors.dark, width: 2) : null),
      child: hasIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: paddingleft),
                  child: SizedBox(
                    height: sizedBoxSizes,
                    width: sizedBoxSizes,
                  ),
                ),
                Expanded(
                  child: Text(
                    textButton,
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle(
                        color: textColor, size: 16.0, weight: FontWeight.w500),
                  ),
                ),
                Container(
                  height: 38.0,
                  width: 38.0,
                  margin: const EdgeInsets.only(right: 16.0, left: 8.0),
                  decoration: BoxDecoration(
                      color: circleIconColor, shape: BoxShape.circle),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 18.0,
                  ),
                ),
              ],
            )
          : Text(
              textButton,
              style: AppStyles.textStyle(
                  color: textColor, size: 16.0, weight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
    );
  }
}
