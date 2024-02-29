import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/add_card_controller.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/widgets/custom_image_view.dart';
import 'package:secure_app/widgets/horizontal_tab_element_widget.dart';

import '../../../../controllers/form_controller.dart';

class AddCardDescriptionScreen extends StatelessWidget {
  AddCardDescriptionScreen({super.key});
  final AddCardController _addCardController = Get.put(AddCardController());
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final FormController _formController = Get.put(FormController());
  final List<String> socialsListItem = [
    "Facebook",
    "Amazon",
    "Alibaba",
    "Shein",
    "Tiktok",
    "Twitter",
    "Meta",
    "etc...",
  ];
  /*@override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      height: Constants.screenHeight(context),
      child: Stack(
        children: [
          _topNavBarController.pageIndex.value == 5
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    Assets.images.createCardBg,
                    width: Constants.screenWidth(context),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.only(top: 74.0, bottom: 40.0),
                // padding: const EdgeInsets.only(top: 59.0, bottom: 40.0),
                // child: GestureDetector(
                //   onTap: () {
                //     _topNavBarController.pageIndex(1);
                //     _topNavBarController.scrollController.jumpTo(0);
                //     // Get.back();
                //   },
                //   child: const Icon(
                //     FontAwesomeIcons.arrowLeft,
                //     // size: 25.0,
                //   ),
                // ),
              ),
              SizedBox(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Nos cartes  virtuelles ',
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 27,
                          height: 0.9,
                          weight: FontWeight.w500,
                          // height: 0.04,
                          // letterSpacing: -0.75,
                        ),
                      ),
                      TextSpan(
                        text: 'Visa et Mastercard',
                        style: AppStyles.textStyle(
                          color: AppColors.primary,
                          size: 27,
                          height: 0.9,
                          weight: FontWeight.w500,
                          // height: 0.04,
                          // letterSpacing: -0.75,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' sont les plus stables du marché Africain, et compatibles avec\n',
                        style: AppStyles.textStyle(
                          color: AppColors.dark,
                          size: 27,
                          height: 0.9,
                          weight: FontWeight.w500,
                          // height: 0.04,
                          // letterSpacing: -0.75,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                '99%',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 100,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                  letterSpacing: -12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 19.7),
                child: Text(
                  'Des plateformes en ligne',
                  style: AppStyles.textStyle(
                    color: AppColors.dark,
                    size: 28,
                    weight: FontWeight.w500,
                    // height: 0.04,
                  ),
                ),
              ),
              Wrap(
                runSpacing: 8.05,
                spacing: 5.38,
                children: List.generate(
                    socialsListItem.length,
                    (index) => HorizontalTabElementWidget(
                          label: socialsListItem[index],
                          hasMargin: false,
                          isSelected: false,
                          color: AppColors.addCardSocialsBg,
                        )),
              ),
            ]),
          ),
        ],
      ),
    );
  }*/


  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/img_group_744.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      //margin: EdgeInsets.only(top: 52*fem, left: 20*fem, right: 20*fem),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 21),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 29),
                      SizedBox(
                      height: 44,
                      width: 45,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Container(
                          height: 44,
                          width: 45,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0XFFFFE19A),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: InkWell(
                              onTap: (){
                                print("----------------clic 1");
                              },
                              child: SizedBox(
                                height: 44,
                                width: 45,
                                child: SvgPicture.asset(
                                  'assets/images/img_calendar.svg',
                                  height: 44,
                                  width: 45,
                                  fit: BoxFit.contain,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.primary, BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: (){
                          print("----------------clic 2");
                        },
                      ),
                    ),
                      const SizedBox(height: 11),
                      Container(
                        width: 251*fem,
                        margin: EdgeInsets.only(
                          left: 41*fem,
                          right: 40*fem,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Profitez des cartes virtuelles ",
                                style:
                                AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.03*fem,
                                  color: AppColors.gray10,
                                ),
                              ),
                              TextSpan(
                                text: "Visa",
                                style:AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.04*fem,
                                  color: AppColors.primary,
                                ),
                              ),
                              TextSpan(
                                text: " et ",
                                style:AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.03*fem,
                                  color: AppColors.gray10,
                                ),
                              ),
                              TextSpan(
                                text: "Mastercard ",
                                style:AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.04*fem,
                                  color: AppColors.primary,
                                ),
                              ),
                              TextSpan(
                                text: " stables et ",
                                style:AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.03*fem,
                                  color: AppColors.gray10,
                                ),
                              ),
                              TextSpan(
                                text: "compatibles à 99% en ligne ",
                                style: AppStyles.textStyle (
                                  size: 25*ffem,
                                  weight: FontWeight.w500,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.03*fem,
                                  color: AppColors.gray10,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 11),
                      Container(
                        width: 288*fem,
                        margin: EdgeInsets.only(
                          left: 22*fem,
                          right: 23*fem,
                        ),
                        child: Text(
                          " Avec Sekure créer instantanément jusqu'à 6 cartes bancaires virtuelles Visa ou Mastercard.Soyez sans limite et restez le seul maître du Jeu. ",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle (
                            size: 12*ffem,
                            weight: FontWeight.w300,
                            height: 1.5*ffem/fem,
                            letterSpacing: -0.03*fem,
                            color: const Color(0XFF5D5D5D),
                          ),
                        ),
                      ),
                      const SizedBox(height: 34),
                      _topNavBarController.pageIndex.value == 1 ||
                          _topNavBarController.pageIndex.value == 5
                          ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 30*fem),
                        padding: EdgeInsets.fromLTRB(9*fem, 11.75*fem, 9*fem, 0*fem),
                        //width: 466*fem,
                        height: 68.75*fem,
                        child: TextButton(
                          onPressed: () {
                            if (_topNavBarController.pageIndex.value == 1) {
                              _topNavBarController.pageIndex(5);
                            } else {
                              _topNavBarController.pageIndex(6);
                            }
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(50*fem, 12*fem, 50*fem, 12*fem),
                            //width: 285*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(12*fem),
                            ),
                            child: Text(
                              textAlign:TextAlign.center,
                              _topNavBarController.pageIndex.value == 1 ? 'Obtenir une nouvelle carte' : 'Créer une carte ',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 15*ffem,
                                weight: FontWeight.w500,
                                height: 2.3*ffem/fem,
                                letterSpacing: -0.075*fem,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                          : const SizedBox(),
                      const SizedBox(height: 17),
                      SizedBox(
                        width: double.infinity,
                        //height: 646*fem,
                        height: 390*fem,
                        child: Stack(
                          children: [
                            /*Positioned(
                              left: 0*fem,
                              top: 31.9996986389*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 686.51*fem,
                                  height: 473*fem,
                                  child: Image.asset(
                                    'assets/images/group-wDV.png',
                                    width: 686.51*fem,
                                    height: 473*fem,
                                  ),
                                ),
                              ),
                            ),*/
                            Positioned(
                              left: -50*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 320*fem,
                                  height: 542*fem,
                                  child: Image.asset(
                                    'assets/images/image-38-9KR.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
