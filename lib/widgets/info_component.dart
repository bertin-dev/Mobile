import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/models/info_model.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';
import 'package:secure_app/ressources/constants.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({super.key, required this.info, required this.isOnlyOne, required this.fem, required this.ffem});
  final InfoModel info;
  final bool isOnlyOne;
  final double fem;
  final double ffem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isOnlyOne ? 72*fem : 0*fem,
      width: isOnlyOne ? 345*fem : 545*fem,
      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, isOnlyOne ? 26*fem : 200*fem, 0*fem),
      padding: EdgeInsets.fromLTRB(12*fem, 9*fem, 28*fem, 9*fem),
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
                        info.title!,
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
                    info.message!,
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
    );
  }
}
