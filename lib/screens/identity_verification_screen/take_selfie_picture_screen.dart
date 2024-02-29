import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/camera_controller.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/picture_screen/take_picture_screen.dart';

class TakeSelfiePictureScreen extends StatelessWidget {
  TakeSelfiePictureScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final UserController _userController = Get.put(UserController());
  final CameraControler cameraControler = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Obx(() {
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () async {
                Map results = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TakePictureScreen(
                      isSelfie: true,
                    ),
                  ),
                );
                // _userController.personImage =
                //     await _formController.getOneImage(isCamera: false);
                _userController.personImagePath(results['imagePath']);
                // print(_userController.personImage);
              },
              child: _userController.personImagePath.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 13.0),
                      child: Image.file(
                        key: Key(_userController.personImagePath.value),
                        File(_userController.personImagePath.value),
                        width: double.infinity,
                        height: 250.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      children: [
                        SvgPicture.asset(Assets.icons.camera),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                child: Text(
                                  'Cliquez ici pour prendre un selfie',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.textPoppinsStyle(
                                    color: const Color(0xFF606060),
                                    size: 10,
                                    // height: 0.8,
                                  ),
                                ),
                              ),
                              Text(
                                localUser.idPaper != null &&
                                        localUser.idPaper!.isNotEmpty
                                    ? 'de vous tenant votre votre ${localUser.idPaper}'
                                    : 'de vous tenant votre votre ${_userController.idType.value}',
                                textAlign: TextAlign.center,
                                style: AppStyles.textPoppinsStyle(
                                  color: const Color(0xFF606060),
                                  size: 10,
                                  // height: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(Assets.icons.selfiPerson),
                      ],
                    ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.white,
                          size: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11.0),
                    Expanded(
                      child: Text(
                        'Envoyez une photo de vous en train de tenir votre document d’identification',
                        style: AppStyles.textStyle(
                            color: Colors.black, size: 12, height: 0.9),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.white,
                          size: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11.0),
                    Expanded(
                      child: Text(
                        'Rassurez vous que votre visage et votre document d’identification sont bien visibles',
                        style: AppStyles.textStyle(
                            color: Colors.black, size: 12, height: 0.9),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.white,
                          size: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11.0),
                    Expanded(
                      child: Text(
                        'Prenez des photos de bonne qualité',
                        style: AppStyles.textStyle(
                            color: Colors.black, size: 12, height: 0.9),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          color: AppColors.dark,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Icon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.white,
                          size: 12.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 11.0),
                    Expanded(
                      child: Text(
                        'Filmez l’entièreté de vos documents',
                        style: AppStyles.textStyle(
                            color: Colors.black, size: 12, height: 0.9),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: Constants.screenHeight(context) / 7)
      ],
    );
  }
}
