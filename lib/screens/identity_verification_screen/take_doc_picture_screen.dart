import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';
import 'package:secure_app/screens/picture_screen/take_picture_screen.dart';

import '../../controllers/camera_controller.dart';

class TakeDocPictureScreen extends StatelessWidget {
  TakeDocPictureScreen({super.key});
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
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              Map results = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TakePictureScreen(
                      // Pass the automatically generated path to
                      // the DisplayPictureScreen widget.
                      // camera: cameraControler.cameras,
                      ),
                ),
              );
              // print(results);
              // _userController.cniRecto =
              //     await _formController.getOneImage(isCamera: false);
              _userController.cniRectoPath(results['imagePath']);
              // print(_userController.cniRecto);
            },
            child: Column(
              children: [
                Obx(() {
                  return _userController.cniRectoPath.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 13.0),
                          child: Image.file(
                            key: Key(_userController.cniRectoPath.value),
                            File(_userController.cniRectoPath.value),
                            width: double.infinity,
                            height: 180.0,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Column(
                          children: [
                            SvgPicture.asset(Assets.icons.camera),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      localUser.idPaper != null &&
                                              localUser.idPaper!.isNotEmpty
                                          ? 'Prendre une photo de votre ${localUser.idPaper}'
                                          : 'Prendre une photo de votre ${_userController.idType.value}',
                                      textAlign: TextAlign.center,
                                      style: AppStyles.textPoppinsStyle(
                                        color: const Color(0xFF606060),
                                        size: 10,
                                        // height: 0.8,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '(Recto)',
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
                          ],
                        );
                }),
                Container(
                  padding: const EdgeInsets.only(
                    top: 13.5,
                    bottom: 13.5,
                    right: 18.0,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.brown300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(Assets.icons.person),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        (localUser.idPaper != null &&
                    localUser.idPaper!.toLowerCase() != "passeport") &&
                _userController.idType.value.toLowerCase() != "passeport"
            ? Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () async {
                    Map results = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TakePictureScreen(
                            // Pass the automatically generated path to
                            // the DisplayPictureScreen widget.
                            // camera: cameraControler.cameras,
                            ),
                      ),
                    );
                    // _userController.cniVerso =
                    //     await _formController.getOneImage(isCamera: false);
                    _userController.cniVersoPath(results['imagePath']);
                    // print(_userController.cniVerso);
                  },
                  child: Column(
                    children: [
                      Obx(() {
                        return _userController.cniVersoPath.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 13.0),
                                child: Image.file(
                                  key: Key(_userController.cniVersoPath.value),
                                  File(_userController.cniVersoPath.value),
                                  width: double.infinity,
                                  height: 180.0,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child:
                                        SvgPicture.asset(Assets.icons.camera),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            localUser.idPaper != null &&
                                                    localUser
                                                        .idPaper!.isNotEmpty
                                                ? 'Prendre une photo de votre ${localUser.idPaper}'
                                                : 'Prendre une photo de votre ${_userController.idType.value}',
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textPoppinsStyle(
                                              color: const Color(0xFF606060),
                                              size: 10,
                                              // height: 0.8,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '(Verso)',
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
                                ],
                              );
                      }),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17.0, horizontal: 12.0),
                        decoration: const BoxDecoration(
                          color: AppColors.brown300,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Assets.icons.fadeIcon,
                                ),
                                SvgPicture.asset(
                                  Assets.icons.fadeIcon,
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: SvgPicture.asset(
                                Assets.icons.fadeIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox(),
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
                        'Rassurez vous que vos documents sont conformes',
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
