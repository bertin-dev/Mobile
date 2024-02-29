import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/service_screen/components/service_button_component.dart';
import 'package:secure_app/screens/service_screen/components/social_circle_component.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'contact@getsekure.com',
    queryParameters: {'subject': 'Demande de renseignements'},
  );
  final Uri messengerLaunchUri = Uri.parse("https://me.me/getsekure");
  final Uri facebookLaunchUri = Uri.parse("https://www.facebook.com/getsekure");
  final Uri twitterLaunchUri = Uri.parse("https://www.twitter.com/getsekure");
  final Uri instagramLaunchUri =
      Uri.parse("https://www.instagram.com/getsekure");
  final Uri webSiteLaunchUri = Uri.parse("https://www.getsekure.com");
  final Uri chatLaunchUri = Uri.parse("https://www.getsekure.com");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.imputBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: AppColors.dark,
                        // size: 25.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: [
                      SvgPicture.asset(
                        Assets.icons.service,
                        color: AppColors.primary,
                        width: 65.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 29.0),
                        child: Text(
                          "Nous vous répondons en quelques minutes",
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 25.0,
                            weight: FontWeight.w700,
                            height: 0.9,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, top: 9.0),
                        child: Text(
                          "notre service client par chat est ouvert de 8 à 20h pour vous repondre immediatement",
                          textAlign: TextAlign.center,
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 12.0,
                            height: 0.9,
                          ),
                        ),
                      ),
                      ServiceButtonComponent(
                        color: AppColors.primary,
                        textColor: AppColors.white,
                        textButton: "Chattez directement avec nous",
                        shouldOPenGleap: true,
                        url: chatLaunchUri,
                      ),
                      ServiceButtonComponent(
                        color: AppColors.white,
                        textColor: AppColors.dark,
                        textButton: "Contacter via mail",
                        url: emailLaunchUri,
                      ),
                      ServiceButtonComponent(
                        color: AppColors.white,
                        textColor: AppColors.dark,
                        textButton: "Contacter via Messenger",
                        url: messengerLaunchUri,
                      ),
                      ServiceButtonComponent(
                        color: AppColors.white,
                        textColor: AppColors.dark,
                        hasIcon: true,
                        textButton: "www.getsekure.com",
                        url: webSiteLaunchUri,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height / 7),
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "en savoir plus sur ",
                      style: AppStyles.textStyle(
                          color: AppColors.dark, size: 12.0),
                      children: [
                        TextSpan(
                          text: "Sekure",
                          style: AppStyles.textStyle(
                            color: AppColors.dark,
                            size: 12.0,
                            weight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialCircle(
                          icon: FontAwesomeIcons.facebookF,
                          url: facebookLaunchUri,
                        ),
                        const SizedBox(width: 15.0),
                        SocialCircle(
                          icon: FontAwesomeIcons.twitter,
                          url: twitterLaunchUri,
                        ),
                        // SizedBox(width: 15.0),
                        // SocialCircle(
                        //   icon: FontAwesomeIcons.linkedinIn,
                        // ),
                        const SizedBox(width: 15.0),
                        SocialCircle(
                          icon: FontAwesomeIcons.instagram,
                          url: instagramLaunchUri,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
