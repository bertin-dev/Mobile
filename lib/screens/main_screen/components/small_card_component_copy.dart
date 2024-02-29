import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/card_button_widget.dart';

class SmallCardComponent extends StatelessWidget {
  final bool isVisa;
  final Color color;
  const SmallCardComponent(
      {super.key, required this.color, required this.isVisa});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              isVisa ? 'Carte Visa' : "Carte Mastercard",
              style: AppStyles.textStyle(
                color: AppColors.white,
                size: 14,
                weight: FontWeight.w500,
              ),
            ),
          ),
          const Text(
            '**** **** **** 5547',
            style: TextStyle(
              color: Color(0xFFFAF7F0),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardButtonWidget(
                buttonLabel: "Carte de debit",
                color: AppColors.white,
                textColor: AppColors.dark,
                padding: 8.0,
              ),
              SizedBox(width: 7.0),
              CardButtonWidget(
                buttonLabel: "Multiusage",
                color: AppColors.dark,
                textColor: AppColors.white,
                padding: 8.0,
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Opacity(
              opacity: 0.50,
              child: Text(
                'Créée le 03 Juillet 2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(Assets.icons.visa.path),
              const SizedBox(width: 55.0),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: AppColors.white,
                    size: 10.0,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
