import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_styles.dart';

class CardButtonWidget extends StatelessWidget {
  final String buttonLabel;
  final Color color;
  final Color textColor;
  final double padding;
  final bool hasSpecialCaracters;
  const CardButtonWidget({
    super.key,
    required this.buttonLabel,
    required this.color,
    required this.textColor,
    this.padding = 18.0,
    this.hasSpecialCaracters = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: padding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: FittedBox(
        child: Text(
          buttonLabel,
          style: hasSpecialCaracters
              ? TextStyle(
                  color: textColor,
                  fontSize: MediaQuery.of(context).size.width * 0.015,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0,
                )
              : AppStyles.textStyle(
                  color: textColor,
                  size: MediaQuery.of(context).size.width * 0.015,
                  weight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
