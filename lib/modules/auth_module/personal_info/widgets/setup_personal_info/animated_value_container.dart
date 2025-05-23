import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:urfit/core/style/colors.dart';
import 'package:urfit/core/style/fonts.dart';
import 'package:urfit/core/utils/constants.dart';

class ValueContainer extends StatelessWidget {
  final dynamic value;
  final bool isSelected;
  final void Function()? onTap;

  const ValueContainer({
    super.key,
    required this.value,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 36,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : AppColors.cardColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: value is num
              ? AnimatedFlipCounter(
                  value: value,
                  textStyle: CustomTextStyle.semiBold_16.copyWith(
                    color: isSelected
                        ? AppColors.selectedFont
                        : AppColors.fontColor,
                  ),
                )
              : Text(
                  value,
                  style: CustomTextStyle.semiBold_16.copyWith(
                    color: isSelected
                        ? AppColors.selectedFont
                        : AppColors.fontColor,
                  ),
                ),
        ),
      ),
    );
  }
}
