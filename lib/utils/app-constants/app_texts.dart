import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextsStyle {
  TextStyle smallGrayishCapitalTitle(context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.kGreyColor, fontWeight: FontWeight.bold);
  }

  TextStyle smallPrimaryCapitalTitle(context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.kPrimaryColor, fontSize: 11);
  }

  TextStyle appBarTitleText(context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle bodyMedium(context) {
    return Theme.of(context).textTheme.bodyMedium!;
  }

  TextStyle bodyMediumPrimary(context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.kPrimaryColor);
  }

  TextStyle bodyMediumLightWeight(context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle bodySmall(context) {
    return Theme.of(context).textTheme.bodySmall!;
  }

  TextStyle bodySmallGrey(context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.kGreyColor);
  }

  TextStyle titleMediumGrey(context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.kGreyColor, fontWeight: FontWeight.w400);
  }

  TextStyle titleMedium(context) {
    return Theme.of(context).textTheme.titleMedium!;
  }

  TextStyle titleMediumSemiBold(context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle headlineLargeDark(context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.kBackgroundDarkColor);
  }

  TextStyle headlineLargeLight(context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(color: AppColors.kLightColor);
  }

  TextStyle headlineLarge(context) {
    return Theme.of(context).textTheme.headlineLarge!;
  }

  TextStyle headlineSmall(context) {
    return Theme.of(context).textTheme.headlineSmall!;
  }

  TextStyle headlineMediumDark(context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.kBackgroundDarkColor);
  }

  TextStyle headlineMedium(context) {
    return Theme.of(context).textTheme.headlineMedium!;
  }
}
