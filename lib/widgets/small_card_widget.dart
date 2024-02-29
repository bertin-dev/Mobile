import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/card_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/widgets/card_button_widget.dart';

class SmallCardWidget extends StatelessWidget {
  final CardModel card;
  final Color color;
  SmallCardWidget({super.key, required this.color, required this.card});

  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final CardController _cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _topNavBarController.pageIndex(7);
        _cardController
            .selectedCardIndex!(_cardController.cards!.indexOf(card));
        _topNavBarController.scrollController.jumpTo(2);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(11.0),
        // margin: const EdgeInsets.only(right: 10.0),
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
                'Carte ${card.brand!.capitalize!}',
                style: AppStyles.textStyle(
                  color: AppColors.white,
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              '**** **** **** ${card.number!.substring(15, card.number!.length).toString()}',
              style: const TextStyle(
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
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Opacity(
                opacity: 0.50,
                child: Text(
                  'Créée le ${card.createdAt!}',
                  style: const TextStyle(
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
                card.brand! == "MASTERCARD"
                    ? SvgPicture.asset(Assets.icons.masterCardWhite)
                    : Image.asset(Assets.icons.visa.path),
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
      ),
    );
  }
}
