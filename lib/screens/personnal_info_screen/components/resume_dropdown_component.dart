import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:secure_app/gen/assets.gen.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class DropDownComponent extends StatelessWidget {
  final List<String> itemsList;
  final bool hasIcon;
  final String fieldLabel;
  final void Function(String?)? onChanged;
  const DropDownComponent({
    super.key,
    required this.itemsList,
    this.hasIcon = false,
    required this.fieldLabel,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(8.0),
      color: AppColors.imputBg,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 16),
          border: InputBorder.none,
        ),
        hint: Text(
          fieldLabel,
          style: AppStyles.textPoppinsStyle(
            color: AppColors.dark,
            size: 12.0,
          ),
        ),
        items: itemsList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      hasIcon
                          ? Image.asset(
                              Assets.icons.cmrFlag.path,
                              // width: 10.0,
                              // height: 6.0,
                            )
                          : const SizedBox(),
                      hasIcon ? const SizedBox(width: 9.0) : const SizedBox(),
                      Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        style: AppStyles.textPoppinsStyle(
          color: AppColors.dark,
          size: 12.0,
        ),
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 19),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            FontAwesomeIcons.chevronDown,
            size: 16.0,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
