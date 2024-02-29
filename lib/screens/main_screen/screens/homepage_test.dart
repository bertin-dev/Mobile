import 'package:flutter/material.dart';
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

class UnverifiedHomeScreen extends StatelessWidget {
  UnverifiedHomeScreen({super.key});
  final FormController _formController = Get.put(FormController());
  final List<String> webSitesList = [
    "facebook",
    "Amazon",
    "Alibaba",
    "Shein",
    "Tiktok",
    "Twitter",
    "Meta",
    "etc..."
  ];

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 1795*fem,
        decoration: BoxDecoration (
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0*fem, 4*fem),
              blurRadius: 2*fem,
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(22*fem, 21*fem, 19*fem, 22*fem),
                width: 393*fem,
                height: 599*fem,
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
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AccountVerificationScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0*fem, 2*fem, 120*fem, 0*fem),
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
                                                    image: const DecorationImage (
                                                      fit: BoxFit.cover,
                                                      image: AssetImage (
                                                        'assets/images/ellipse-2-bg-QsD.png',
                                                      ),
                                                    ),
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
                          GestureDetector(
                            onTap: () {
                              Get.to(() => AccountVerificationScreen());
                            },
                            child: TextButton(
                              onPressed: () {},
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
                          ),
                        ],
                      ),
                    ),


                    //card
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
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
                                      width: 185*fem,
                                      height: 59*fem,
                                      child: Text(
                                        'Recharge ton compte ',
                                        style: AppStyles.textStyle (
                                          size: 34*ffem,
                                          weight: FontWeight.w500,
                                          height: 0.8676470588*ffem/fem,
                                          letterSpacing: -0.17*fem,
                                          color: AppColors.white,
                                        ),
                                      ),
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
                                                        "+\$00,00",
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
                                      padding: EdgeInsets.fromLTRB(111*fem, 10.5*fem, 0*fem, 9*fem),
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
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
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
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 131*fem, 3*fem),
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
                                                    margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                                    child: Text(
                                                      '\$4,00',
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
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0*fem,
              top: 559*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(10*fem, 0*fem, 0*fem, 0*fem),
                width: 638*fem,
                height: 484*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 0*fem, 18*fem),
                      width: double.infinity,
                      height: 72*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                            padding: EdgeInsets.fromLTRB(12*fem, 9*fem, 28*fem, 9*fem),
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(18*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                  width: 15*fem,
                                  height: 13.36*fem,
                                  child: Image.asset(
                                    'assets/images/group-129.png',
                                    width: 15*fem,
                                    height: 13.36*fem,
                                  ),
                                ),
                                SizedBox(
                                  width: 248*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0.14*fem, 0*fem, 91*fem, 9*fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8.86*fem, 0*fem),
                                              width: 18*fem,
                                              height: 18*fem,
                                              child: Image.asset(
                                                'assets/images/auto-group-1sv1.png',
                                                width: 18*fem,
                                                height: 18*fem,
                                              ),
                                            ),
                                            Text(
                                              'le service client SEKURE',
                                              style: AppStyles.textStyle (
                                                size: 12*ffem,
                                                weight: FontWeight.w500,
                                                height: 1.125*ffem/fem,
                                                letterSpacing: -0.18*fem,
                                                color: AppColors.textCustomerServiceColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints (
                                          maxWidth: 234*fem,
                                        ),
                                        child: Text(
                                          'Utiliser votre solde USD pour créer et recharger votre carte Sekure',
                                          style: AppStyles.textStyle (
                                            size: 10*ffem,
                                            weight: FontWeight.w400,
                                            height: 1.35*ffem/fem,
                                            letterSpacing: -0.15*fem,
                                            color: AppColors.textCustomerServiceColor,
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
                            padding: EdgeInsets.fromLTRB(12*fem, 9*fem, 27*fem, 9*fem),
                            width: 303*fem,
                            height: double.infinity,
                            decoration: BoxDecoration (
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.circular(18*fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                                  width: 15*fem,
                                  height: 13.36*fem,
                                  child: Image.asset(
                                    'assets/images/group-129-XTq.png',
                                    width: 15*fem,
                                    height: 13.36*fem,
                                  ),
                                ),
                                SizedBox(
                                  width: 235*fem,
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0.14*fem, 0*fem, 92*fem, 9*fem),
                                        width: double.infinity,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8.86*fem, 0*fem),
                                              width: 18*fem,
                                              height: 18*fem,
                                              child: Image.asset(
                                                'assets/images/auto-group-8qn3.png',
                                                width: 18*fem,
                                                height: 18*fem,
                                              ),
                                            ),
                                            Text(
                                              'le service client SEKURE',
                                              style: AppStyles.textStyle (
                                                size: 12*ffem,
                                                weight: FontWeight.w500,
                                                height: 1.125*ffem/fem,
                                                letterSpacing: -0.18*fem,
                                                color: AppColors.textCustomerServiceColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Votre solde XAF vous permet d’effectuer des transferts vers mobile et aux utilisateurs Sekure',
                                        style: AppStyles.textStyle (
                                          size: 10*ffem,
                                          weight: FontWeight.w400,
                                          height: 1.35*ffem/fem,
                                          letterSpacing: -0.15*fem,
                                          color: AppColors.textCustomerServiceColor,
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
                    SizedBox(
                      width: 370.14*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 23.14*fem, 19*fem),
                            constraints: BoxConstraints (
                              maxWidth: 303*fem,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: AppStyles.textStyle (
                                  fontFamily: 'FONTSPRING DEMO - Lufga Light',
                                  size: 35*ffem,
                                  weight: FontWeight.w300,
                                  height: 1*ffem/fem,
                                  letterSpacing: -0.175*fem,
                                  color: AppColors.chatBubleBg,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Payer n’importe quoi ',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.chatBubleBg,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'en ligne depuis l’Afrique ',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'va devenir plus ',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.chatBubleBg,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'facile',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' avec les cartes ',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.chatBubleBg,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'sekure',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '...',
                                    style: AppStyles.textStyle (
                                      size: 35*ffem,
                                      weight: FontWeight.w400,
                                      height: 1*ffem/fem,
                                      letterSpacing: -0.175*fem,
                                      color: AppColors.chatBubleBg,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 0*fem),
                              width: double.infinity,
                              height: 150*fem,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                                    width: 168.57*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(10*fem),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 14.6094970703*fem,
                                          top: 17*fem,
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(0*fem, 5.5*fem, 0*fem, 0*fem),
                                            width: 135.3*fem,
                                            //height: 100*fem,
                                            decoration: BoxDecoration (
                                              borderRadius: BorderRadius.circular(13*fem),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(3.37*fem, 0*fem, 0*fem, 0*fem),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                      children :[
                                                  Text(
                                                    'Carte',
                                                    style: AppStyles.textStyle (
                                                      fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                      size: 14*ffem,
                                                      weight: FontWeight.w500,
                                                      height: 1*ffem/fem,
                                                      color: AppColors.white,
                                                    ),
                                                  ),
                                                        Text(
                                                          'Mastercard',
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                            size: 14*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1*ffem/fem,
                                                            color: AppColors.white,
                                                          ),
                                                        ),
                                                  
                                                  ]
                                                  )
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.45*fem, 0*fem),
                                                  width: double.infinity,
                                                  height: 68*fem,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0*fem,
                                                        top: 53*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            width: 108*fem,
                                                            height: 15*fem,
                                                            child: Text(
                                                              'Crée le 03 Juillet 2023',
                                                              style: AppStyles.textStyle (
                                                                fontFamily: 'Poppins',
                                                                size: 10*ffem,
                                                                weight: FontWeight.w400,
                                                                height: 1.5*ffem/fem,
                                                                color: AppColors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0*fem,
                                                        top: 20.8841552734*fem,
                                                        child: Container(
                                                          //width: 134.86*fem,
                                                          //height: 35*fem,
                                                          decoration: BoxDecoration (
                                                            borderRadius: BorderRadius.circular(13*fem),
                                                          ),
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.47*fem, 0*fem),
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                //width: 70.13*fem,
                                                                //height: 20*fem,
                                                                decoration: BoxDecoration (
                                                                  color: AppColors.white,
                                                                  borderRadius: BorderRadius.circular(13*fem),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Carte de debit',
                                                                    style: AppStyles.textStyle (
                                                                      fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                                      size: 8*ffem,
                                                                      weight: FontWeight.w500,
                                                                      height: 4.3125*ffem/fem,
                                                                      letterSpacing: -0.04*fem,
                                                                      color: AppColors.txtSoldeColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                //width: 56.27*fem,
                                                                //height: 20*fem,
                                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                                decoration: BoxDecoration (
                                                                  color: AppColors.txtSoldeColor,
                                                                  borderRadius: BorderRadius.circular(13*fem),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    '3D secure',
                                                                    style: AppStyles.textStyle (
                                                                      fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                                      size: 8*ffem,
                                                                      weight: FontWeight.w500,
                                                                      height: 4.3125*ffem/fem,
                                                                      letterSpacing: -0.04*fem,
                                                                      color: AppColors.white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0.4471435547*fem,
                                                        top: 0*fem,
                                                        child: Align(
                                                          child: SizedBox(
                                                            width: 120*fem,
                                                            height: 35*fem,
                                                            child: Text(
                                                              '**** **** **** 5547',
                                                              style: AppStyles.textStyle (
                                                                fontFamily: 'Poppins',
                                                                size: 12*ffem,
                                                                weight: FontWeight.w500,
                                                                height: 2.6538461538*ffem/fem,
                                                                letterSpacing: -0.065*fem,
                                                                color: AppColors.facebookAdsCardBgColor,
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
                                        Positioned(
                                          left: 12.3619384766*fem,
                                          top: 120*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 30.51*fem,
                                              height: 17.19*fem,
                                              child: Image.asset(
                                                'assets/images/group-131.png',
                                                width: 30.51*fem,
                                                height: 17.19*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 130.9999996566*fem,
                                          top: 116*fem,
                                          child: Align(
                                            child: SizedBox(
                                              width: 24*fem,
                                              height: 24*fem,
                                              child: Image.asset(
                                                'assets/images/group-114.png',
                                                width: 24*fem,
                                                height: 24*fem,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(33.35*fem, 22.5*fem, 13.14*fem, 10*fem),
                                    width: 168.57*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: AppColors.green100Color,
                                      borderRadius: BorderRadius.circular(10*fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19.08*fem, 14*fem),
                                            constraints: BoxConstraints (
                                              maxWidth: 103*fem,
                                            ),
                                            child: Text(
                                              'Créer une nouvelle Carte virtuelle',
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle (
                                                fontFamily: 'Lufga',
                                                size: 14*ffem,
                                                weight: FontWeight.w500,
                                                height: 0.8571428571*ffem/fem,
                                                letterSpacing: -0.42*fem,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(5.08*fem, 0*fem, 0*fem, 0*fem),
                                          width: 117*fem,
                                          height: 69.5*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 92.9999996566*fem,
                                                top: 45.5001220703*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 24*fem,
                                                    height: 24*fem,
                                                    child: Image.asset(
                                                      'assets/images/group-115-FZD.png',
                                                      width: 24*fem,
                                                      height: 24*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0*fem,
                                                top: 0*fem,
                                                child: Container(
                                                  width: 93*fem,
                                                  height: 51*fem,
                                                  decoration: BoxDecoration (
                                                    borderRadius: BorderRadius.circular(24.5000019073*fem),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(24.5000019073*fem),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          left: 0.0000028153*fem,
                                                          top: 1.5001144409*fem,
                                                          child: Align(
                                                            child: SizedBox(
                                                              width: 93*fem,
                                                              height: 49*fem,
                                                              child: Container(
                                                                decoration: BoxDecoration (
                                                                  borderRadius: BorderRadius.circular(24.5000019073*fem),
                                                                  color: AppColors.primary,
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: AppColors.yellow200Color,
                                                                      offset: Offset(0*fem, 10*fem),
                                                                      blurRadius: 5*fem,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 36.1809663773*fem,
                                                          top: 0*fem,
                                                          child: Center(
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 20*fem,
                                                                height: 51*fem,
                                                                child: Text(
                                                                  '+',
                                                                  textAlign: TextAlign.center,
                                                                  style: AppStyles.textStyle (
                                                                    fontFamily: 'Poppins',
                                                                    size: 40*ffem,
                                                                    weight: FontWeight.w400,
                                                                    height: 1.2575*ffem/fem,
                                                                    color: AppColors.white,
                                                                  ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0*fem,
              top: 1063*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(14*fem, 28*fem, 22*fem, 51*fem),
                width: 393*fem,
                //height: 712*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 0*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(115*fem, 9.5*fem, 16*fem, 9.5*fem),
                          width: double.infinity,
                          decoration: BoxDecoration (
                            color: AppColors.txtSoldeColor,
                            borderRadius: BorderRadius.circular(32*fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 79*fem, 0*fem),
                                child: Text(
                                  'Voir mes cartes',
                                  style: AppStyles.textStyle (
                                    fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                    size: 16*ffem,
                                    weight: FontWeight.w500,
                                    height: 2.15625*ffem/fem,
                                    letterSpacing: -0.08*fem,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 29*fem,
                                height: 29*fem,
                                child: Image.asset(
                                  'assets/images/group-95.png',
                                  width: 29*fem,
                                  height: 29*fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 0*fem),
                      width: 349*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(7*fem, 0*fem, 8*fem, 17.64*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 0*fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 82*fem, 10*fem),
                                        child: Text(
                                          '\nDernieres transactions ',
                                          style: AppStyles.textStyle (
                                            fontFamily: 'FONTSPRING DEMO - Lufga',
                                            size: 18*ffem,
                                            weight: FontWeight.w700,
                                            height: 1*ffem/fem,
                                            letterSpacing: -0.09*fem,
                                            color: AppColors.chatBubleBg,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: TextButton.styleFrom (
                                          padding: EdgeInsets.zero,
                                        ),
                                        child: Text(
                                          'voir plus',
                                          style: AppStyles.textStyle (
                                            fontFamily: 'Lufga',
                                            size: 13*ffem,
                                            weight: FontWeight.w400,
                                            height: 2.6538461538*ffem/fem,
                                            letterSpacing: -0.065*fem,
                                            color: AppColors.grey200Color,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 40.36*fem,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0.88*fem, 5.04*fem, 0*fem),
                                        width: 78.96*fem,
                                        height: 39.48*fem,
                                        decoration: BoxDecoration (
                                          border: Border.all(color: AppColors.chatBubleBg),
                                          color: AppColors.chatBubleBg,
                                          borderRadius: BorderRadius.circular(22*fem),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'Tout',
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle (
                                                fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                size: 12*ffem,
                                                weight: FontWeight.w500,
                                                height: 2.875*ffem/fem,
                                                letterSpacing: -0.06*fem,
                                                color: AppColors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0.36*fem),
                                        width: 79*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          color: AppColors.white300Color,
                                          borderRadius: BorderRadius.circular(22*fem),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'Solde',
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle (
                                                fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                size: 12*ffem,
                                                weight: FontWeight.w500,
                                                height: 2.875*ffem/fem,
                                                letterSpacing: -0.06*fem,
                                                color: AppColors.chatBubleBg,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0.88*fem, 4.69*fem, 0*fem),
                                        width: 67.31*fem,
                                        height: 39.48*fem,
                                        decoration: BoxDecoration (
                                          color: AppColors.white300Color,
                                          borderRadius: BorderRadius.circular(22*fem),
                                        ),
                                        child: Center(
                                          child: Center(
                                            child: Text(
                                              'Cartes',
                                              textAlign: TextAlign.center,
                                              style: AppStyles.textStyle (
                                                fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                size: 12*ffem,
                                                weight: FontWeight.w500,
                                                height: 2.875*ffem/fem,
                                                letterSpacing: -0.06*fem,
                                                color: AppColors.chatBubleBg,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0.36*fem),
                                        width: 94*fem,
                                        height: double.infinity,
                                        decoration: BoxDecoration (
                                          borderRadius: BorderRadius.circular(22*fem),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 90.94*fem,
                                                  height: 39*fem,
                                                  child: Container(
                                                    decoration: BoxDecoration (
                                                      borderRadius: BorderRadius.circular(22*fem),
                                                      color: AppColors.white300Color,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 22*fem,
                                              top: 1.5*fem,
                                              child: Center(
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 50*fem,
                                                    height: 35*fem,
                                                    child: Text(
                                                      'Transferts',
                                                      textAlign: TextAlign.center,
                                                      style: AppStyles.textStyle (
                                                        fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                        size: 12*ffem,
                                                        weight: FontWeight.w500,
                                                        height: 2.875*ffem/fem,
                                                        letterSpacing: -0.06*fem,
                                                        color: AppColors.chatBubleBg,
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
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(15*fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(11.25*fem, 7.5*fem, 11.25*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-txq3.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10*fem, 1*fem, 0*fem, 1*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 114.5*fem, 8*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Recharge',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.textCustomerServiceColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.chatDateColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        // fcfa6Rq (1:563)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                                        child: Text(
                                                          '+3500 Fcfa',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1.2575*ffem/fem,
                                                            color: AppColors.txtSoldeColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                                        child: Text(
                                                          'Réussi',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 11*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 1.5*ffem/fem,
                                                            color: AppColors.primary,
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
                                SizedBox(
                                  height: 15*fem,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(11.63*fem, 7.5*fem, 11.63*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-5yfq.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10*fem, 0.5*fem, 0*fem, 0.5*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 3.5*fem, 113.75*fem, 8.5*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Retrait',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.textCustomerServiceColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.chatDateColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4.5*fem),
                                                      child: Text(
                                                        '+3500 Fcfa',
                                                        textAlign: TextAlign.right,
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 12*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.txtSoldeColor,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.25*fem, 0*fem),
                                                      child: Text(
                                                        'Réussi',
                                                        textAlign: TextAlign.right,
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 11*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15*fem,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(10.81*fem, 7.5*fem, 10.81*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-g8rf.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5*fem, 1.5*fem, 0*fem, 1.5*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 2.5*fem, 89.38*fem, 7.5*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Débit Facebook.com',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.textCustomerServiceColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.chatDateColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.5*fem),
                                                        child: Text(
                                                          '+3500 Fcfa',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1.2575*ffem/fem,
                                                            color: AppColors.txtSoldeColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // russiBhV (1:572)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                                                        child: Text(
                                                          'Réussi',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 11*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 1.5*ffem/fem,
                                                            color: AppColors.primary,
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
                                SizedBox(
                                  height: 15*fem,
                                ),
                                TextButton(
                                  // frame124tM1 (1:589)
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(12.25*fem, 7.5*fem, 12.25*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-2qef.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(5*fem, 1.5*fem, 0*fem, 1.5*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 2.5*fem, 112.75*fem, 7.5*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Recharge',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.white150Color,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.white150Color,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.75*fem, 1.5*fem),
                                                        child: Text(
                                                          '+3500 Fcfa',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 14*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1.2575*ffem/fem,
                                                            color: AppColors.white150Color,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Echec',
                                                        textAlign: TextAlign.right,
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 11*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.white150Color,
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
                                SizedBox(
                                  height: 15*fem,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(11.63*fem, 7.5*fem, 11.63*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-3bhm.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10*fem, 1.5*fem, 0*fem, 1.5*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 2.5*fem, 92.75*fem, 7.5*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Débit Amazon.com',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.textCustomerServiceColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.chatDateColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.5*fem),
                                                        child: Text(
                                                          '+3500 Fcfa',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1.2575*ffem/fem,
                                                            color: AppColors.txtSoldeColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        // russiDEB (1:603)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.25*fem, 0*fem),
                                                        child: Text(
                                                          'Réussi',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 11*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 1.5*ffem/fem,
                                                            color: AppColors.primary,
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
                                      )
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15*fem,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(11.63*fem, 7.5*fem, 11.63*fem, 7.5*fem),
                                    width: double.infinity,
                                    height: 60*fem,
                                    decoration: BoxDecoration (
                                      color: AppColors.grey700Color,
                                      borderRadius: BorderRadius.circular(15*fem),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45*fem,
                                            height: 45*fem,
                                            child: Image.asset(
                                              'assets/images/auto-group-nqqh.png',
                                              width: 45*fem,
                                              height: 45*fem,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(10*fem, 1.5*fem, 0*fem, 1.5*fem),
                                            height: double.infinity,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 2.5*fem, 113.75*fem, 7.5*fem),
                                                  height: double.infinity,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Retrait',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'FONTSPRING DEMO - Lufga Medium',
                                                          size: 13*ffem,
                                                          weight: FontWeight.w500,
                                                          height: 1.2575*ffem/fem,
                                                          color: AppColors.textCustomerServiceColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        // aujourdhui1423cp3 (1:579)
                                                        'Aujourd’hui, 14:23',
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.5*ffem/fem,
                                                          color: AppColors.chatDateColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.5*fem),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3.5*fem),
                                                        child: Text(
                                                          '+3500 Fcfa',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 12*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 1.2575*ffem/fem,
                                                            color: AppColors.txtSoldeColor,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1.25*fem, 0*fem),
                                                        child: Text(
                                                          'Réussi',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 11*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 1.5*ffem/fem,
                                                            color: AppColors.primary,
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
          ],
        ),
      ),
    );
  }
}
