import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class SeeAccountButtonComponent extends StatelessWidget {
  SeeAccountButtonComponent({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: () {
          _topNavBarController.pageIndex(5);
          _topNavBarController.scrollController.jumpTo(2);
        },
        child: Container(
          // width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 11.0),
          decoration: BoxDecoration(
              color: AppColors.dark, borderRadius: BorderRadius.circular(50.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 10,
                  width: 10,
                ),
              ),
              Expanded(
                child: Text(
                  "voir mon compte",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                      color: AppColors.white,
                      size: 10.0,
                      weight: FontWeight.w500),
                ),
              ),
              Container(
                height: 17.0,
                width: 17.0,
                margin: const EdgeInsets.only(right: 16.0, left: 8.0),
                decoration: const BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                child: const Icon(
                  FontAwesomeIcons.chevronRight,
                  color: AppColors.dark,
                  size: 9.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
