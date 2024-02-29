import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/top_nav_bar_controller.dart';
import 'package:secure_app/screens/service_screen/components/social_circle_component.dart';

class SupportSocialsRow extends StatelessWidget {
  SupportSocialsRow({super.key});
  final TopNavBarController _topNavBarController =
      Get.put(TopNavBarController());

  // final Uri messengerLaunchUri = Uri.parse("https://me.me/getsekure");
  final Uri facebookLaunchUri = Uri.parse("https://www.facebook.com/getsekure");
  final Uri twitterLaunchUri = Uri.parse("https://www.twitter.com/getsekure");
  final Uri instagramLaunchUri =
      Uri.parse("https://www.instagram.com/getsekure");

  @override
  Widget build(BuildContext context) {
    return _topNavBarController.pageIndex.value == 4
        ? Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              // height: Get.height,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
            ),
          )
        : const SizedBox();
  }
}
