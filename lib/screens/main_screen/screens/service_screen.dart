import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gleap_sdk/gleap_sdk.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/service_screen/components/social_circle_component.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  void initState() {
    //Gleap.open();
    //Gleap.showFeedbackButton(true);

    super.initState();
  }

  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'cards@getsekure.com',
    queryParameters: {'subject': 'CallOut user Profile'},
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 67.0),
      // padding: const EdgeInsets.only(top: 139.0),
      child: SizedBox(
        // height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 43.0),
              child: const Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    // width: 305,
                    // height: 87,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Vous rencontrez un',
                            style: TextStyle(
                              color: Color(0xFF0F0F0F),
                              fontSize: 36,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                              letterSpacing: -0.18,
                            ),
                          ),
                          TextSpan(
                            text: ' problème',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 36,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w500,
                              height: 0.02,
                              letterSpacing: -0.18,
                            ),
                          ),
                          TextSpan(
                            text: '? ',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 36,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w500,
                              height: 0.9,
                              letterSpacing: -0.18,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 272,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Le service client vous ',
                            style: TextStyle(
                              color: Color(0xFF0F0F0F),
                              fontSize: 16,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w400,
                              height: 0.9,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextSpan(
                            text: 'répond',
                            style: TextStyle(
                              color: Color(0xFF18BC7A),
                              fontSize: 16,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w400,
                              height: 0.13,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextSpan(
                            text: ' en ',
                            style: TextStyle(
                              color: Color(0xFF0F0F0F),
                              fontSize: 16,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w400,
                              height: 0.9,
                              letterSpacing: -0.08,
                            ),
                          ),
                          TextSpan(
                            text: 'moins d’une minute',
                            style: TextStyle(
                              color: Color(0xFF0F0F0F),
                              fontSize: 16,
                              fontFamily: 'Lufga',
                              fontWeight: FontWeight.w400,
                              height: 0.9,
                              letterSpacing: -0.08,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 43.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Gleap.open();
                      Gleap.showFeedbackButton(true);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 71,
                      padding: const EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                        color: const Color(0xFF18BC7A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'écrire maintenant',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(emailLaunchUri);
                    },
                    child: Container(
                      width: double.infinity,
                      // height: 51,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF18BC7A)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 8),
                          Text(
                            'Envoyer un mail:',
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'cards@getsekure.com',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              // margin: EdgeInsets.only(right: 16.0),
              width: Get.width,
              height: Get.height / 2,
              child: Image.asset(
                Assets.images.servicePng.path,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: Constants.screenHeight(context) / 14)
          ],
        ),
      ),
    );
  }
}
