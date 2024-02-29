import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';

import '../../../../ressources/app_styles.dart';

class CardsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // iphone14pro801WW (5:16104)
        width: double.infinity,
        height: 960*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 21*fem, 0*fem, 17*fem),
                width: 393*fem,
                height: 819*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 19*fem, 5*fem),
                      width: double.infinity,
                      height: 55.5*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 2.5*fem, 0*fem, 0*fem),
                            child: Text(
                              'Mes cartes',
                              style: AppStyles.textStyle (
                                size: 31*ffem,
                                weight: FontWeight.w600,
                                height: 1.1612903226*ffem/fem,
                                letterSpacing: -1.705*fem,
                                color: Color(0xff0f0f0f),
                              ),
                            ),
                          ),
                          SizedBox(
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
                                        'assets/images/frame-91.png',
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
                                      color: Color(0xff18bc7a),
                                      borderRadius: BorderRadius.circular(44*fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '+',
                                        style: AppStyles.textStyle (
                                          fontFamily: 'Poppins',
                                          size: 18*ffem,
                                          weight: FontWeight.w600,
                                          height: 1.3333333333*ffem/fem,
                                          color: Color(0xffffffff),
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
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 21*fem),
                      width: double.infinity,
                      height: 60.5*fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                            width: 160*fem,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 1*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 106*fem,
                                      height: 35*fem,
                                      child: Text(
                                        'Solde total cartes',
                                        style: AppStyles.textStyle (
                                          size: 11*ffem,
                                          weight: FontWeight.w300,
                                          height: 3.1363636364*ffem/fem,
                                          letterSpacing: -0.055*fem,
                                          color: Color(0xff0f0f0f),
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
                                      width: 160*fem,
                                      height: 35*fem,
                                      child: Text(
                                        '248 000 Fcfa',
                                        style: AppStyles.textStyle (
                                          fontFamily: 'Poppins',
                                          size: 25*ffem,
                                          weight: FontWeight.w500,
                                          height: 1.38*ffem/fem,
                                          letterSpacing: -0.125*fem,
                                          color: Color(0xff0f0f0f),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //page indicator
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 29.5*fem, 0*fem, 0*fem),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xff18bc7a),
                                  ),
                                ),
                                SizedBox(
                                  width: 7*fem,
                                ),
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xffffeab9),
                                  ),
                                ),
                                SizedBox(
                                  width: 7*fem,
                                ),
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xffffeab9),
                                  ),
                                ),
                                SizedBox(
                                  width: 7*fem,
                                ),
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xffffeab9),
                                  ),
                                ),
                                SizedBox(
                                  width: 7*fem,
                                ),
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xffffeab9),
                                  ),
                                ),
                                SizedBox(
                                  width: 7*fem,
                                ),
                                Container(
                                  width: 7*fem,
                                  height: 7*fem,
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(3.5*fem),
                                    color: Color(0xffffeab9),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(left: 3),
                        //margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 0*fem),
                       // width: double.infinity,
                       // height: 608*fem,
                        child: IntrinsicWidth(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                                  //width: 305*fem,
                                  //height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                                        width: double.infinity,
                                        height: 443*fem,
                                        decoration: BoxDecoration (
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x21000000),
                                              offset: Offset(0*fem, 15*fem),
                                              blurRadius: 12.9499998093*fem,
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // group150XiN (5:21588)
                                              left: 0*fem,
                                              top: 0*fem,
                                              child: Container(
                                                width: 305*fem,
                                                height: 443*fem,
                                                decoration: BoxDecoration (
                                                  image: DecorationImage (
                                                    fit: BoxFit.cover,
                                                    image: AssetImage (
                                                      'assets/images/rectangle-1-93C.png',
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  // maskgroup1dY (5:21590)
                                                  child: SizedBox(
                                                    width: 305*fem,
                                                    height: 443*fem,
                                                    child: Image.asset(
                                                      'assets/images/mask-group-Pjc.png',
                                                      width: 305*fem,
                                                      height: 443*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // cartemastercardvkW (5:24268)
                                              left: 36.9999906458*fem,
                                              top: 192.499999694*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 19*fem,
                                                  height: 211*fem,
                                                  child: Text(
                                                    'Carte Mastercard',
                                                    style: AppStyles.textStyle (
                                                      size: 25*ffem,
                                                      weight: FontWeight.w500,
                                                      height: 0.56*ffem/fem,
                                                      color: Color(0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // group7286n22 (5:27109)
                                              left: 25*fem,
                                              top: 22.0000008348*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 34*fem,
                                                  height: 34*fem,
                                                  child: Image.asset(
                                                    'assets/images/group-7286-Pwk.png',
                                                    width: 34*fem,
                                                    height: 34*fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // groupUQe (5:27079)
                                              left: 133*fem,
                                              top: 358*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 40.63*fem,
                                                  height: 47*fem,
                                                  child: Image.asset(
                                                    'assets/images/group-2pv.png',
                                                    width: 40.63*fem,
                                                    height: 47*fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // group7287aTg (5:24293)
                                              left: 238.9999982515*fem,
                                              top: 204.4999995629*fem,
                                              child: Container(
                                                width: 37*fem,
                                                height: 203*fem,
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      // abombokonohonorinehYJ (5:24294)
                                                      left: 15.9999930936*fem,
                                                      top: 0*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 21*fem,
                                                          height: 203*fem,
                                                          child: Text(
                                                            'Abombo  Kono Honorine',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 15*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 1.5*ffem/fem,
                                                              color: Color(0xffffffff),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      // titulairenJr (5:24295)
                                                      left: 0*fem,
                                                      top: 158.0000001093*fem,
                                                      child: Align(
                                                        child: SizedBox(
                                                          width: 16*fem,
                                                          height: 45*fem,
                                                          child: Text(
                                                            'Titulaire',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 10*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 1.5*ffem/fem,
                                                              color: Color(0xffffffff),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // vectorftS (5:24351)
                                              left: 197.9999946672*fem,
                                              top: 283.9999989509*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 24*fem,
                                                  height: 122*fem,
                                                  child: Image.asset(
                                                    'assets/images/vector-YJA.png',
                                                    width: 24*fem,
                                                    height: 122*fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // vectorzA2 (5:24314)
                                              left: 224.9999965905*fem,
                                              top: 35.9999825994*fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 49*fem,
                                                  height: 78*fem,
                                                  child: Image.asset(
                                                    'assets/images/vector-4UE.png',
                                                    width: 49*fem,
                                                    height: 78*fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 22*fem, 0*fem),
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // autogroupdxxrper (NVhf3MoJi1snr6yHMeDXXR)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78*fem, 6*fem),
                                              width: double.infinity,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // carte01MPt (5:24317)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                                                    child: Text(
                                                      'Carte 01',
                                                      style: AppStyles.textStyle (
                                                        size: 15*ffem,
                                                        weight: FontWeight.w700,
                                                        height: 2.3*ffem/fem,
                                                        letterSpacing: -0.075*fem,
                                                        color: Color(0xff242424),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    // crele25jan2024f9g (5:24318)
                                                    'Créée le 25 jan 2024',
                                                    textAlign: TextAlign.right,
                                                    style: AppStyles.textStyle (
                                                      size: 12*ffem,
                                                      weight: FontWeight.w400,
                                                      height: 2.875*ffem/fem,
                                                      letterSpacing: 0.24*fem,
                                                      color: Color(0xffb1aeae),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              // group7256aGe (5:24321)
                                              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                                              width: double.infinity,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // group7257VPc (5:24323)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
                                                    width: 17*fem,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          // group7223ofC (5:24324)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                                                          width: 17*fem,
                                                          height: 17*fem,
                                                          child: Image.asset(
                                                            'assets/images/group-7223-ENA.png',
                                                            width: 17*fem,
                                                            height: 17*fem,
                                                          ),
                                                        ),
                                                        Container(
                                                          // group7225uy8 (5:24352)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25.46*fem),
                                                          width: 17*fem,
                                                          height: 17*fem,
                                                          child: Image.asset(
                                                            'assets/images/group-7225-Sbg.png',
                                                            width: 17*fem,
                                                            height: 17*fem,
                                                          ),
                                                        ),
                                                        Container(
                                                          // group7224d8S (5:24327)
                                                          width: double.infinity,
                                                          height: 17*fem,
                                                          decoration: BoxDecoration (
                                                            color: Color(0xffffdf95),
                                                            borderRadius: BorderRadius.circular(7*fem),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              '!',
                                                              style: AppStyles.textStyle (
                                                                size: 15*ffem,
                                                                weight: FontWeight.w800,
                                                                height: 0.8666666667*ffem/fem,
                                                                color: Color(0xffffffff),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // idealepourlesachatsenligneetle (5:24322)
                                                    constraints: BoxConstraints (
                                                      maxWidth: 245*fem,
                                                    ),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        style: AppStyles.textStyle (
                                                          fontFamily: 'Poppins',
                                                          size: 10*ffem,
                                                          weight: FontWeight.w400,
                                                          height: 1.3*ffem/fem,
                                                          color: Color(0xff000000),
                                                        ),
                                                        children: [
                                                          TextSpan(
                                                            text: 'Ideale pour les achats en ligne et les publicités facebook\n\nAucun frais de Maintenance, Frais de recharge et de paiement reduits\n\nImposition des frais d’echec de paiement \n',
                                                          ),
                                                          TextSpan(
                                                            text: '\n',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 10*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 1.3*ffem/fem,
                                                              color: Color(0xff000000),
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
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1207*fem,
                                height: 603.46*fem,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0*fem,
                                      top: 0*fem,
                                      child: Container(
                                        width: 438*fem,
                                        height: 603.46*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                                              width: double.infinity,
                                              height: 443*fem,
                                              decoration: BoxDecoration (
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x21000000),
                                                    offset: Offset(0*fem, 15*fem),
                                                    blurRadius: 12.9499998093*fem,
                                                  ),
                                                ],
                                              ),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    // group150wCz (5:25714)
                                                    left: 0*fem,
                                                    top: 0*fem,
                                                    child: Container(
                                                      width: 305*fem,
                                                      height: 443*fem,
                                                      decoration: BoxDecoration (
                                                        image: DecorationImage (
                                                          fit: BoxFit.cover,
                                                          image: AssetImage (
                                                            'assets/images/rectangle-12.png',
                                                          ),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        // maskgroupEht (5:25716)
                                                        child: SizedBox(
                                                          width: 305*fem,
                                                          height: 443*fem,
                                                          child: Image.asset(
                                                            'assets/images/mask-group.png',
                                                            width: 305*fem,
                                                            height: 443*fem,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // cartemastercardwMQ (5:27044)
                                                    left: 36.9999906458*fem,
                                                    top: 192.499999694*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 19*fem,
                                                        height: 211*fem,
                                                        child: Text(
                                                          'Carte Mastercard',
                                                          style: AppStyles.textStyle (
                                                            size: 25*ffem,
                                                            weight: FontWeight.w500,
                                                            height: 0.56*ffem/fem,
                                                            color: Color(0xff1e1e1e),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // group7286nsp (5:27115)
                                                    left: 25*fem,
                                                    top: 22.0000008348*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 34*fem,
                                                        height: 34*fem,
                                                        child: Image.asset(
                                                          'assets/images/group-7286-SVc.png',
                                                          width: 34*fem,
                                                          height: 34*fem,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // group67p (5:27067)
                                                    left: 133*fem,
                                                    top: 358*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 40.63*fem,
                                                        height: 47*fem,
                                                        child: Image.asset(
                                                          'assets/images/group.png',
                                                          width: 40.63*fem,
                                                          height: 47*fem,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // group7287nmL (5:27046)
                                                    left: 238.9999962845*fem,
                                                    top: 294.4999995629*fem,
                                                    child: Container(
                                                      width: 199*fem,
                                                      height: 75.5*fem,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            // abombokonohonorineHxz (5:27047)
                                                            margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 37.5*fem),
                                                            child: Text(
                                                              'Abombo  Kono Honorine',
                                                              style: AppStyles.textStyle (
                                                                fontFamily: 'Poppins',
                                                                size: 15*ffem,
                                                                weight: FontWeight.w400,
                                                                height: 1.5*ffem/fem,
                                                                color: Color(0xff1e1e1e),
                                                              ),
                                                            ),
                                                          ),
                                                          Text(
                                                            // numrodecarteoRY (5:27048)
                                                            'Numéro de carte',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 10*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 1.5*ffem/fem,
                                                              color: Color(0xff1e1e1e),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // vectorw1x (5:27049)
                                                    left: 197.9999946672*fem,
                                                    top: 283.9999989509*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 24*fem,
                                                        height: 122*fem,
                                                        child: Image.asset(
                                                          'assets/images/vector-dMp.png',
                                                          width: 24*fem,
                                                          height: 122*fem,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // vectorqt2 (5:27050)
                                                    left: 224.9999965905*fem,
                                                    top: 35.9999825994*fem,
                                                    child: Align(
                                                      child: SizedBox(
                                                        width: 49*fem,
                                                        height: 78*fem,
                                                        child: Image.asset(
                                                          'assets/images/vector-4UE.png',
                                                          width: 49*fem,
                                                          height: 78*fem,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 0*fem),
                                              width: 275*fem,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // autogroup8kd55XU (NVhd7fWRAesNCUMGNz8KD5)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 78*fem, 6*fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          // carte01oTU (5:27052)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                                                          child: Text(
                                                            'Carte 01',
                                                            style: AppStyles.textStyle (
                                                              size: 15*ffem,
                                                              weight: FontWeight.w700,
                                                              height: 2.3*ffem/fem,
                                                              letterSpacing: -0.075*fem,
                                                              color: Color(0xff242424),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          // crele25jan2024Vr6 (5:27053)
                                                          'Créée le 25 jan 2024',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            size: 12*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 2.875*ffem/fem,
                                                            letterSpacing: 0.24*fem,
                                                            color: Color(0xffb1aeae),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // group7256DXC (5:27055)
                                                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                                                    width: double.infinity,
                                                    height: 99.46*fem,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // group7257XXt (5:27057)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
                                                          width: 17*fem,
                                                          height: double.infinity,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // group7223qoU (5:27058)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                                                                width: 17*fem,
                                                                height: 17*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-7223-tCN.png',
                                                                  width: 17*fem,
                                                                  height: 17*fem,
                                                                ),
                                                              ),
                                                              Container(
                                                                // group7225k9k (5:27061)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25.46*fem),
                                                                width: 17*fem,
                                                                height: 17*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-7223-tCN.png',
                                                                  width: 17*fem,
                                                                  height: 17*fem,
                                                                ),
                                                              ),
                                                              Container(
                                                                // group7224TZx (5:27064)
                                                                width: double.infinity,
                                                                height: 17*fem,
                                                                decoration: BoxDecoration (
                                                                  color: Color(0xffffdf95),
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    '!',
                                                                    style: AppStyles.textStyle (
                                                                      size: 15*ffem,
                                                                      weight: FontWeight.w800,
                                                                      height: 0.8666666667*ffem/fem,
                                                                      color: Color(0xffffffff),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          // idealepourlesachatsenligneetle (5:27056)
                                                          constraints: BoxConstraints (
                                                            maxWidth: 245*fem,
                                                          ),
                                                          child: Text(
                                                            'Ideale pour les achats en ligne et les publicités facebook\n\nAucun frais de Maintenance, Frais de recharge et de paiement reduits\n\nImposition des frais d’echec de paiement',
                                                            style: AppStyles.textStyle (
                                                              fontFamily: 'Poppins',
                                                              size: 10*ffem,
                                                              weight: FontWeight.w400,
                                                              height: 1.3*ffem/fem,
                                                              color: Color(0xff000000),
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
                                    Positioned(
                                      left: 330*fem,
                                      top: 0*fem,
                                      child: Container(
                                        width: 877*fem,
                                        height: 603.46*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20*fem),
                                              width: 564*fem,
                                              height: 443*fem,
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                    // group152bTC (5:24357)
                                                    left: 0*fem,
                                                    top: 0*fem,
                                                    child: Container(
                                                      width: 438*fem,
                                                      height: 443*fem,
                                                      decoration: BoxDecoration (
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Color(0x21000000),
                                                            offset: Offset(0*fem, 15*fem),
                                                            blurRadius: 12.9499998093*fem,
                                                          ),
                                                        ],
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            // group15057U (5:24358)
                                                            left: 0*fem,
                                                            top: 0*fem,
                                                            child: Container(
                                                              width: 305*fem,
                                                              height: 443*fem,
                                                              decoration: BoxDecoration (
                                                                image: DecorationImage (
                                                                  fit: BoxFit.cover,
                                                                  image: AssetImage (
                                                                    'assetsm/images/rectangle-1-Dgz.png',
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Center(
                                                                // maskgroupnGn (5:24360)
                                                                child: SizedBox(
                                                                  width: 305*fem,
                                                                  height: 443*fem,
                                                                  child: Image.asset(
                                                                    'assets/images/mask-group-af8.png',
                                                                    width: 305*fem,
                                                                    height: 443*fem,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // cartemastercardiAS (5:25688)
                                                            left: 36.9999906458*fem,
                                                            top: 290.499999694*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 177*fem,
                                                                height: 15*fem,
                                                                child: Text(
                                                                  'Carte Mastercard',
                                                                  style: AppStyles.textStyle (
                                                                    size: 25*ffem,
                                                                    weight: FontWeight.w500,
                                                                    height: 0.56*ffem/fem,
                                                                    color: Color(0xff1e1e1e),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // group7286Bpi (5:27103)
                                                            left: 25*fem,
                                                            top: 22.0000008348*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 34*fem,
                                                                height: 34*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-7286.png',
                                                                  width: 34*fem,
                                                                  height: 34*fem,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // group6Rt (5:27091)
                                                            left: 133*fem,
                                                            top: 358*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 40.63*fem,
                                                                height: 47*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-cRC.png',
                                                                  width: 40.63*fem,
                                                                  height: 47*fem,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // group7287bNe (5:25690)
                                                            left: 238.9999962845*fem,
                                                            top: 294.4999995629*fem,
                                                            child: Container(
                                                              width: 199*fem,
                                                              height: 75.5*fem,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    // abombokonohonorinehga (5:25691)
                                                                    margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 37.5*fem),
                                                                    child: Text(
                                                                      'Abombo  Kono Honorine',
                                                                      style: AppStyles.textStyle (
                                                                        fontFamily: 'Poppins',
                                                                        size: 15*ffem,
                                                                        weight: FontWeight.w400,
                                                                        height: 1.5*ffem/fem,
                                                                        color: Color(0xff1e1e1e),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    // numrodecartenxv (5:25692)
                                                                    'Numéro de carte',
                                                                    style: AppStyles.textStyle (
                                                                      fontFamily: 'Poppins',
                                                                      size: 10*ffem,
                                                                      weight: FontWeight.w400,
                                                                      height: 1.5*ffem/fem,
                                                                      color: Color(0xff1e1e1e),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // vectorvJS (5:25693)
                                                            left: 197.9999946672*fem,
                                                            top: 283.9999989509*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 24*fem,
                                                                height: 122*fem,
                                                                child: Image.asset(
                                                                  'assets/images/vector-11Q.png',
                                                                  width: 24*fem,
                                                                  height: 122*fem,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // vector2cN (5:25694)
                                                            left: 224.9999965905*fem,
                                                            top: 35.9999825994*fem,
                                                            child: Align(
                                                              child: SizedBox(
                                                                width: 49*fem,
                                                                height: 78*fem,
                                                                child: Image.asset(
                                                                  'assets/images/vector-4UE.png',
                                                                  width: 49*fem,
                                                                  height: 78*fem,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    // group152jmg (5:27187)
                                                    left: 301*fem,
                                                    top: 0*fem,
                                                    child: Container(
                                                      width: 263*fem,
                                                      height: 443*fem,
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            // group150rrJ (5:27188)
                                                            left: 29*fem,
                                                            top: 0*fem,
                                                            child: Container(
                                                              width: 205*fem,
                                                              height: 443*fem,
                                                              decoration: BoxDecoration (
                                                                borderRadius: BorderRadius.circular(18*fem),
                                                                image: DecorationImage (
                                                                  fit: BoxFit.cover,
                                                                  image: AssetImage (
                                                                    'assets/images/rectangle-1-726.png',
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            // group72969qQ (5:28565)
                                                            left: 0*fem,
                                                            top: 119.0000762939*fem,
                                                            child: Container(
                                                              width: 263*fem,
                                                              height: 286*fem,
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    // group72954xN (5:28564)
                                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 82*fem),
                                                                    padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                                                                    width: double.infinity,
                                                                    decoration: BoxDecoration (
                                                                      borderRadius: BorderRadius.circular(44*fem),
                                                                    ),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Container(
                                                                          // frame95Zu8 (5:28561)
                                                                          margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 61*fem),
                                                                          width: 51*fem,
                                                                          height: 50*fem,
                                                                          child: Image.asset(
                                                                            'assets/images/frame-95.png',
                                                                            width: 51*fem,
                                                                            height: 50*fem,
                                                                          ),
                                                                        ),
                                                                        Center(
                                                                          // ajouterunenouvellecartevirtuel (5:28559)
                                                                          child: Text(
                                                                            'Ajouter une nouvelle carte virtuelle',
                                                                            textAlign: TextAlign.center,
                                                                            style: AppStyles.textStyle (
                                                                              size: 18*ffem,
                                                                              weight: FontWeight.w500,
                                                                              height: 1.2777777778*ffem/fem,
                                                                              color: Color(0xff0f0f0f),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    // group9Vx (5:28525)
                                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.37*fem, 0*fem),
                                                                    width: 40.63*fem,
                                                                    height: 47*fem,
                                                                    child: Image.asset(
                                                                      'assets/images/group-cRC.png',
                                                                      width: 40.63*fem,
                                                                      height: 47*fem,
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
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 0*fem),
                                              width: 869*fem,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    // autogroupgeeoyE6 (NVheYHoQfsAYn24vAkGEeo)
                                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 672*fem, 6*fem),
                                                    width: double.infinity,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Container(
                                                          // carte01u7k (5:25696)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 38*fem, 0*fem),
                                                          child: Text(
                                                            'Carte 01',
                                                            style: AppStyles.textStyle (
                                                              size: 15*ffem,
                                                              weight: FontWeight.w700,
                                                              height: 2.3*ffem/fem,
                                                              letterSpacing: -0.075*fem,
                                                              color: Color(0xff242424),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          // crele25jan2024oiv (5:25697)
                                                          'Créée le 25 jan 2024',
                                                          textAlign: TextAlign.right,
                                                          style: AppStyles.textStyle (
                                                            size: 12*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 2.875*ffem/fem,
                                                            letterSpacing: 0.24*fem,
                                                            color: Color(0xffb1aeae),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    // group72567zW (5:25699)
                                                    margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                                                    width: double.infinity,
                                                    height: 99.46*fem,
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          // group72573dG (5:25701)
                                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 12*fem, 0*fem),
                                                          width: 17*fem,
                                                          height: double.infinity,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                // group7223ZrW (5:25702)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
                                                                width: 17*fem,
                                                                height: 17*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-7223-tCN.png',
                                                                  width: 17*fem,
                                                                  height: 17*fem,
                                                                ),
                                                              ),
                                                              Container(
                                                                // group72255K4 (5:25705)
                                                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25.46*fem),
                                                                width: 17*fem,
                                                                height: 17*fem,
                                                                child: Image.asset(
                                                                  'assets/images/group-7223-tCN.png',
                                                                  width: 17*fem,
                                                                  height: 17*fem,
                                                                ),
                                                              ),
                                                              Container(
                                                                // group7224nDU (5:25708)
                                                                width: double.infinity,
                                                                height: 17*fem,
                                                                decoration: BoxDecoration (
                                                                  color: Color(0xffffdf95),
                                                                  borderRadius: BorderRadius.circular(7*fem),
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    '!',
                                                                    style: AppStyles.textStyle (
                                                                      size: 15*ffem,
                                                                      weight: FontWeight.w800,
                                                                      height: 0.8666666667*ffem/fem,
                                                                      color: Color(0xffffffff),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Text(
                                                          // idealepourlesachatsenligneetle (5:25700)
                                                          'Ideale pour les achats en ligne et les publicités facebook\n\nAucun frais de Maintenance, Frais de recharge et de paiement reduits\n\nImposition des frais d’echec de paiement',
                                                          style: AppStyles.textStyle (
                                                            fontFamily: 'Poppins',
                                                            size: 10*ffem,
                                                            weight: FontWeight.w400,
                                                            height: 1.3*ffem/fem,
                                                            color: Color(0xff000000),
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // group72947ux (5:27149)
              left: 0*fem,
              top: 819*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(22*fem, 21*fem, 23*fem, 21*fem),
                width: 393*fem,
                height: 175*fem,
                decoration: BoxDecoration (
                  color: Color(0xfff4f4f4),
                  borderRadius: BorderRadius.circular(25*fem),
                ),
                child: Align(
                  // attentionattentionlesdonnesdev (5:21492)
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    child: Container(
                      constraints: BoxConstraints (
                        maxWidth: 348*fem,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: AppStyles.textStyle (
                            size: 10*ffem,
                            weight: FontWeight.w400,
                            height: 1.4*ffem/fem,
                            letterSpacing: 0.1*fem,
                            color: Color(0xff6f6f6f),
                          ),
                          children: [
                            TextSpan(
                              text: 'ATTENTION:\n',
                              style: AppStyles.textStyle (
                                size: 13*ffem,
                                weight: FontWeight.w600,
                                height: 1.0769230769*ffem/fem,
                                letterSpacing: 0.13*fem,
                                color: Color(0xff6f6f6f),
                              ),
                            ),
                            TextSpan(
                              text: 'Attention Les données de votre carte et de votre compte sekure doivent rester personnelles. Protegez toujours  vos informations et assurez vous de la crédibilité et de la sécurisation des sites ^sur lesquels vous entrez vos données ',
                              style: AppStyles.textStyle (
                                size: 9*ffem,
                                weight: FontWeight.w400,
                                height: 1.5555555556*ffem/fem,
                                letterSpacing: 0.1*fem,
                                color: Color(0xff6f6f6f),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
