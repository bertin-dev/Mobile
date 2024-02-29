import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/profile_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/profile_screen/profile_screen.dart';
import 'package:secure_app/screens/update_profile_screen/components/section_to_update_component.dart';
import 'package:secure_app/screens/update_profile_screen/update_user_info_screen.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});

  final List faqList = [
    {
      "question": "Informations personnelles",
      "icon": Assets.icons.useri,
    },
    {
      "question": "Localisation",
      "icon": Assets.icons.marker,
    },
    {
      "question": "Numero de telephone",
      "icon": Assets.icons.phone,
    },
    {
      "question": "Adresse mail",
      "icon": Assets.icons.envelope,
    },
  ];
  final ProfileController _profileController = Get.put(ProfileController());
  final FormController _formController = Get.put(FormController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.imputBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: GestureDetector(
                  onTap: () {
                    Get.off(() => ProfileScreen());
                  },
                  child: const Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: AppColors.dark,
                    // size: 25.0,
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: faqList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      onTap: () {
                        if (index == 0) {
                          _profileController.updateUserInfoProvider("personal");
                          Get.to(() => UpdateUserInfoScreen());
                        }
                        if (index == 1) {
                          _profileController.updateUserInfoProvider("location");
                          Get.to(() => UpdateUserInfoScreen());
                        }
                        if (index == 2) {
                          _profileController.updateUserInfoProvider("phone");
                          _formController.isPhoneOtpVerification(false);
                          Get.to(() => UpdateUserInfoScreen());
                        }
                        if (index == 3) {
                          _profileController.updateUserInfoProvider("mail");
                          _formController.isOtpVerification(false);
                          Get.to(() => UpdateUserInfoScreen());
                        }
                      },
                      child: SectionToUpdateComponent(
                        title: faqList[index]["question"],
                        icon: faqList[index]["icon"],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
