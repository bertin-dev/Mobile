import 'package:flutter/material.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/ressources/app_styles.dart';

class RoundedCheckbox extends StatefulWidget {
  RoundedCheckbox({
    Key? key,
    required this.isChecked,
    required this.label,
    this.padding = 0.0,
    required this.onChecked,
  }) : super(key: key);

  final bool isChecked;
  final String label;
  final double padding;
  final Function(bool) onChecked;

  @override
  State<RoundedCheckbox> createState() => _RoundedCheckboxState();
}

class _RoundedCheckboxState extends State<RoundedCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChecked(!widget.isChecked);
      },
      child: Padding(
        padding: EdgeInsets.only(right: widget.padding),
        child: Row(
          children: [
            AnimatedContainer(
              // height: 17.0,
              // width: 17.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.0),
                color: widget.isChecked ? AppColors.primary : AppColors.grey300,
              ),
              padding: const EdgeInsets.all(3.0),
              child: Icon(
                Icons.check,
                size: 15.0,
                color: widget.isChecked ? AppColors.white : Colors.transparent,
              ),
            ),
            const SizedBox(width: 6.0),
            Text(
              widget.label,
              style: AppStyles.textStyle(color: AppColors.dark, size: 12.0),
            )
          ],
        ),
      ),
    );
  }
}
