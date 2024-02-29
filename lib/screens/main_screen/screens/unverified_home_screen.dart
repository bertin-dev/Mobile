import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:secure_app/controllers/form_controller.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/repositories/user_repository.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/screens/account_verification_screen/account_verification_description_screen.dart';
import 'package:secure_app/widgets/primary_button.dart';
import 'package:secure_app/widgets/web_site_widget.dart';
import 'package:badges/badges.dart' as badges;

import '../../../controllers/user_controller.dart';
import '../../login_screen/login_screen.dart';

class UnverifiedHomeScreen extends StatelessWidget {
  const UnverifiedHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final UserController userController = Get.put(UserController());
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 1481*fem,
        decoration: const BoxDecoration (
          color: AppColors.white,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(22*fem, 21*fem, 19*fem, 1*fem),
                width: 393*fem,
                height: 1142*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Header
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19.5*fem),
                      width: double.infinity,
                      height: 55.5*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AccountVerificationScreen());
                            },
                            child: Container(
                              //padding: EdgeInsets.fromLTRB(0*fem, 2*fem, 95*fem, 0*fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                                    width: 52*fem,
                                    height: double.infinity,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0*fem,
                                          top: 0*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 50*fem,
                                              height: 50*fem,
                                              child: TextButton(
                                                onPressed: () {},
                                                style: TextButton.styleFrom (
                                                  padding: EdgeInsets.zero,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(25*fem),
                                                  ),
                                                  child: SvgPicture.asset(Assets.icons.sekureUserCircle,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          // group169zFM (1:676)
                                          left: 31*fem,
                                          top: 33*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 21*fem,
                                              height: 21*fem,
                                              child: Image.asset(
                                                'assets/images/group-169-2pK.png',
                                                width: 21*fem,
                                                height: 21*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 11*fem, 0*fem, 15.5*fem),
                                    height: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: AppStyles.textStyle (
                                                size: 16*ffem,
                                                weight: FontWeight.w400,
                                                height: 0.75*ffem/fem,
                                                letterSpacing: -0.08*fem,
                                                color: AppColors.chatBubleBg,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Salut, ',
                                                  style: AppStyles.textStyle (
                                                    size: 16*ffem,
                                                    weight: FontWeight.w400,
                                                    height: 0.75*ffem/fem,
                                                    letterSpacing: -0.08*fem,
                                                    color: AppColors.chatBubleBg,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: localUser.name!.split(" ")[0],
                                                  style: AppStyles.textStyle (
                                                    size: 16*ffem,
                                                    weight: FontWeight.w700,
                                                    height: 0.75*ffem/fem,
                                                    letterSpacing: -0.08*fem,
                                                    color: AppColors.chatBubleBg,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'voir mon profil ',
                                          style: AppStyles.textStyle (
                                            fontFamily: 'Poppins',
                                            size: 11*ffem,
                                            weight: FontWeight.w400,
                                            height: 1.0909090909*ffem/fem,
                                            letterSpacing: -0.055*fem,
                                            color: AppColors.seeProfilColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onTap: (){
                                  showDialogBox(context, userController);
                                },
                                child: const Icon(Icons.output,
                                  size: 30,
                                  color: AppColors.primary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => AccountVerificationScreen());
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: SizedBox(
                                  width: 52*fem,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0*fem,
                                        top: 0*fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 47.84*fem,
                                            height: 48.88*fem,
                                            child: Image.asset(
                                              'assets/images/frame-91-eDy.png',
                                              width: 47.84*fem,
                                              height: 48.88*fem,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 29*fem,
                                        top: 31.5*fem,
                                        child: Container(
                                          width: 23*fem,
                                          height: 24*fem,
                                          decoration: BoxDecoration (
                                            color: AppColors.primary,
                                            borderRadius: BorderRadius.circular(44*fem),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '0',
                                              style: AppStyles.textStyle (
                                                fontFamily: 'Poppins',
                                                size: 12*ffem,
                                                weight: FontWeight.w400,
                                                height: 2*ffem/fem,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //card
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 21.5*fem),
                      padding: EdgeInsets.fromLTRB(34*fem, 0*fem, 0*fem, 27*fem),
                      width: 349*fem,
                      decoration: const BoxDecoration (
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/images/rectangle-1.png',
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 159*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 82*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 233*fem,
                                      height: 159*fem,
                                      child: Image.asset(
                                        'assets/images/frame-127.png',
                                        width: 233*fem,
                                        height: 159*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0*fem,
                                  top: 80*fem,
                                  child: Align(
                                    child: SizedBox(
                                      //width: 195*fem,
                                      height: 59*fem,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children : [
                                            Text(
                                              'Recharge ',
                                              style: AppStyles.textStyle (
                                                size: 34*ffem,
                                                weight: FontWeight.w500,
                                                height: 0.8676470588*ffem/fem,
                                                letterSpacing: -0.17*fem,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            Text(
                                              'ton compte ',
                                              style: AppStyles.textStyle (
                                                size: 34*ffem,
                                                weight: FontWeight.w500,
                                                height: 0.8676470588*ffem/fem,
                                                letterSpacing: -0.17*fem,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ]
                                      )
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 278*fem,
                                  top: 24*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 23*fem,
                                      height: 8*fem,
                                      child: Image.asset(
                                        'assets/images/group-864.png',
                                        width: 23*fem,
                                        height: 8*fem,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0*fem,
                                  top: 32*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 29*fem,
                                      height: 29*fem,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Image.asset(Assets.icons.appIcon.path,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 13*fem),
                            width: 281*fem,
                            height: 122*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(7*fem),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(18*fem, 5.5*fem, 15*fem, 4*fem),
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(7*fem),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 89*fem,
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                                            width: 70*fem,
                                            height: 60.5*fem,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0.4998779297*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      //width: 44*fem,
                                                      height: 35*fem,
                                                      child: Text(
                                                        'Solde XAF',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Lufga',
                                                          size: 11*ffem,
                                                          weight: FontWeight.w300,
                                                          height: 3.1363636364*ffem/fem,
                                                          letterSpacing: -0.055*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0*fem,
                                                  top: 25.5*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 70*fem,
                                                      height: 35*fem,
                                                      child: Text(
                                                        '00,00',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 25*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.38*ffem/fem,
                                                          letterSpacing: -0.125*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: double.infinity,
                                            height: 47*fem,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0*fem,
                                                  top: 0*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      //width: 89*fem,
                                                      height: 35*fem,
                                                      child: Text(
                                                        'Dernière transaction:',
                                                        style: AppStyles.textStyle (
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 3.45*ffem/fem,
                                                          letterSpacing: -0.05*fem,
                                                          color: AppColors.grey300,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 0*fem,
                                                  top: 12*fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      //width: 29*fem,
                                                      height: 35*fem,
                                                      child: Text(
                                                        "+00,00 Xaf",
                                                        style: AppStyles.textStyle (
                                                          size: 9*ffem,
                                                          fontFamily: 'Poppins',
                                                          weight: FontWeight.w500,
                                                          height: 3.8333333333*ffem/fem,
                                                          letterSpacing: -0.045*fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
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
                                    Container(
                                      padding: EdgeInsets.fromLTRB(111*fem, 10.5*fem, 0*fem, 0*fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 9*fem),
                                            width: 19*fem,
                                            height: 19*fem,
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(9.5*fem),
                                              image: const DecorationImage (
                                                fit: BoxFit.cover,
                                                image: AssetImage (
                                                  'assets/images/ellipse-25-bg.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 47*fem),
                                                  width: 14*fem,
                                                  height: 11*fem,
                                                  child: Image.asset(
                                                    'assets/images/vector-stroke-1ET.png',
                                                    width: 14*fem,
                                                    height: 11*fem,
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 9*fem, 0*fem, 0*fem),
                                                  child: Text(
                                                    'CMR',
                                                    style: AppStyles.textStyle (
                                                      size: 11*ffem,
                                                      weight: FontWeight.w700,
                                                      height: 3.1363636364*ffem/fem,
                                                      letterSpacing: -0.055*fem,
                                                      color: AppColors.txtSoldeColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 34*fem, 0*fem),
                            width: 281*fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12*fem),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 57*fem,
                                      decoration: BoxDecoration (
                                        color: AppColors.txtSoldeColor,
                                        borderRadius: BorderRadius.circular(7*fem),
                                      ),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 14*fem,
                                            top: 1*fem,
                                            child: SizedBox(
                                              //width: 249*fem,
                                              height: 38*fem,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 111*fem, 3*fem),
                                                    child: Text(
                                                      'Solde Parrainage',
                                                      style: AppStyles.textStyle (
                                                        size: 12*ffem,
                                                        weight: FontWeight.w500,
                                                        height: 2.875*ffem/fem,
                                                        letterSpacing: -0.06*fem,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    //margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                                    child: Text(
                                                      '0,00 Xaf',
                                                      textAlign: TextAlign.right,
                                                      style: AppStyles.textStyle (
                                                        fontFamily: 'Poppins',
                                                        size: 12*ffem,
                                                        weight: FontWeight.w500,
                                                        height: 2.875*ffem/fem,
                                                        letterSpacing: -0.06*fem,
                                                        color: AppColors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 14*fem,
                                            top: 20*fem,
                                            child: Align(
                                              child: SizedBox(
                                                //width: 110*fem,
                                                height: 35*fem,
                                                child: Text(
                                                  'retrait dans : 07J : 16H  : 5 min',
                                                  style: AppStyles.textStyle (
                                                    size: 9*ffem,
                                                    weight: FontWeight.w500,
                                                    height: 3.8333333333*ffem/fem,
                                                    letterSpacing: -0.045*fem,
                                                    color: AppColors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.13*fem, 0*fem),
                                  width: double.infinity,
                                  height: 50*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0.17*fem),
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(
                                                    () => AccountVerificationScreen());
                                          },
                                          style: TextButton.styleFrom (
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(15*fem, 8*fem, 7*fem, 7.83*fem),
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(22*fem),
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0.46*fem, 12*fem, 0*fem),
                                                  child: Text(
                                                    'Recharger',
                                                    style: AppStyles.textStyle (
                                                      size: 14*ffem,
                                                      weight: FontWeight.w500,
                                                      height: 1*ffem/fem,
                                                      letterSpacing: -0.07*fem,
                                                      color: AppColors.txtSoldeColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 34*fem,
                                                  height: 34*fem,
                                                  child: Image.asset(
                                                    'assets/images/group-124-wuM.png',
                                                    width: 34*fem,
                                                    height: 34*fem,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0.17*fem, 0*fem, 0*fem),
                                        child: TextButton(
                                          onPressed: () {
                                            Get.to(
                                                    () => AccountVerificationScreen());
                                          },
                                          style: TextButton.styleFrom (
                                            padding: EdgeInsets.zero,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(14*fem, 7.83*fem, 10.87*fem, 8*fem),
                                            height: double.infinity,
                                            decoration: BoxDecoration (
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.circular(22*fem),
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0.46*fem, 30*fem, 0*fem),
                                                  child: Text(
                                                    'Retirer',
                                                    style: AppStyles.textStyle (
                                                      size: 14*ffem,
                                                      weight: FontWeight.w500,
                                                      height: 1*ffem/fem,
                                                      letterSpacing: 0.07*fem,
                                                      color: AppColors.txtSoldeColor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  // group124tZZ (I1:643;1:16580)
                                                  width: 34*fem,
                                                  height: 34*fem,
                                                  child: Image.asset(
                                                    'assets/images/group-124-Y9h.png',
                                                    width: 34*fem,
                                                    height: 34*fem,
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //nouveau sur sekure ?
                    Container(
                      margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 193*fem, 8.5*fem),
                      width: double.infinity,
                      height: 35*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 5.5*fem, 5*fem, 8.5*fem),
                            width: 21*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10.5*fem),
                            ),
                            child: Center(
                              child: Text(
                                '!',
                                style: AppStyles.textStyle (
                                  fontFamily: 'Poppins',
                                  size: 17*ffem,
                                  weight: FontWeight.w700,
                                  height: 0.7058823529*ffem/fem,
                                  letterSpacing: -0.085*fem,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Nouveau sur Sekure ?',
                            style: AppStyles.textStyle (
                              fontFamily: 'Poppins',
                              size: 12*ffem,
                              weight: FontWeight.w500,
                              height: 2.875*ffem/fem,
                              letterSpacing: -0.06*fem,
                              color: AppColors.black900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Nos cartes virtuelles
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 23.5*fem),
                      constraints: BoxConstraints (
                        maxWidth: 339*fem,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: AppStyles.textStyle (
                            size: 35*ffem,
                            weight: FontWeight.w300,
                            height: 1*ffem/fem,
                            letterSpacing: -0.175*fem,
                            color: AppColors.black900,
                          ),
                          children: [
                            TextSpan(
                              text: 'Nos cartes  virtuelles  ',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 35*ffem,
                                weight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: -0.175*fem,
                                color: AppColors.black900,
                              ),
                            ),
                            TextSpan(
                              text: 'achètent sur tous les sites',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 35*ffem,
                                weight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: -0.175*fem,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: ' en ligne ... Essayez les cartes ',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 35*ffem,
                                weight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: -0.175*fem,
                                color: AppColors.black900,
                              ),
                            ),
                            TextSpan(
                              text: 'Visa et Mastercard',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 35*ffem,
                                weight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: -0.175*fem,
                                color: AppColors.primary,
                              ),
                            ),
                            TextSpan(
                              text: ' les plus stables du marché Africain ...',
                              style: AppStyles.textStyle (
                                fontFamily: 'Lufga',
                                size: 35*ffem,
                                weight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: -0.175*fem,
                                color: AppColors.black900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //compatible
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 2.38*fem),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Compatibles avec la majorité des sites en ligne',
                          style: AppStyles.textStyle (
                            size: 12*ffem,
                            weight: FontWeight.w500,
                            height: 2.875*ffem/fem,
                            letterSpacing: -0.06*fem,
                            color: AppColors.black900,
                          ),
                        ),
                      ),
                    ),
                    //facebook, amazon
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 51*fem, 6.64*fem),
                      height: 39.48*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.38*fem, 0*fem),
                            width: 78.96*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Facebook',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.38*fem, 0*fem),
                            width: 78.96*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Amazon',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: 67.31*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Alibaba',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0.12*fem, 0*fem, 0.36*fem),
                            width: 56*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Shein',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //tiktok, twitter
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78*fem, 27*fem),
                      height: 39*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            width: 61*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Tiktok',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                            width: 66*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Twitter',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7*fem, 0*fem),
                            width: 57*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'Meta',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 66*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              border: Border.all(color: AppColors.black900),
                              borderRadius: BorderRadius.circular(22*fem),
                            ),
                            child: Center(
                              child: Text(
                                'etc...',
                                style: AppStyles.textStyle (
                                  size: 12*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.875*ffem/fem,
                                  letterSpacing: -0.06*fem,
                                  color: AppColors.black900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //button create new card
                    GestureDetector(
                        onTap: () {
                          Get.to(() => AccountVerificationScreen());
                        },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 1*fem, 0*fem),
                        padding: EdgeInsets.fromLTRB(85.5*fem, 10*fem, 16*fem, 9*fem),
                        width: double.infinity,
                        height: 57*fem,
                        decoration: BoxDecoration (
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(24.5000019073*fem),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.orange100,
                              offset: Offset(0*fem, 15*fem),
                              blurRadius: 10*fem,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25.5*fem, 1*fem),
                              child: Text(
                                'Créer une nouvelle carte',
                                textAlign: TextAlign.center,
                                style: AppStyles.textStyle (
                                  fontFamily: 'Lufga',
                                  size: 14*ffem,
                                  weight: FontWeight.w500,
                                  height: 2.4642857143*ffem/fem,
                                  letterSpacing: -0.07*fem,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            Container(
                              width: 33*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(22*fem),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0*fem,
                                    top: 3*fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 33*fem,
                                        height: 33*fem,
                                        child: Container(
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(22*fem),
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 7*fem,
                                    top: 2*fem,
                                    child: Center(
                                      child: Align(
                                        child: SizedBox(
                                          width: 15*fem,
                                          height: 38*fem,
                                          child: Text(
                                            '+',
                                            textAlign: TextAlign.center,
                                            style: AppStyles.textStyle (
                                              fontFamily: 'Poppins',
                                              size: 30*ffem,
                                              weight: FontWeight.w400,
                                              height: 1.2575*ffem/fem,
                                              color: AppColors.primary,
                                            ),
                                          ),
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
                  ],
                ),
              ),
            ),
            Positioned(
              left: -121 * fem,
              top: 1200.9999618828 * fem,
              child: Align(
                child: SizedBox(
                  width: 500 * fem,
                  height: 500 * fem,
                  child: Transform.rotate(
                    angle: -14.72 * 3.14159265359 / 180, // Conversion des degrés en radians
                    alignment: Alignment.centerLeft, // Alignement à gauche
                    child: Image.asset(
                      'assets/images/image-31.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showDialogBox(BuildContext context, UserController userController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation', style: AppStyles.textStyle(color: AppColors.dark)),
          content: Text('Êtes-vous sûr de vouloir vous déconnecter ?',
          style: AppStyles.textStyle(color: AppColors.dark)),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                    color: AppColors.dark,
                    //size: 17.0,
                    weight: FontWeight.w700,)
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Déconnexion',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                    color: AppColors.dark,
                    //size: 17.0,
                    weight: FontWeight.w700,)
              ),
              onPressed: () {
                Navigator.of(context).pop();
                userController.logoutUser();
                Get.to(() => LoginScreen());
                // Terminer l'application
                //SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
  }
}
