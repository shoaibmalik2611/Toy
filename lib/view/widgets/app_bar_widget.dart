import 'package:flutter/material.dart';

import '../../utils/app-constants/app_colors.dart';
import '../../utils/app-constants/app_constants.dart';
import '../../utils/screen-config/screen_config.dart';
import 'back_icon_widget.dart';

PreferredSizeWidget appBarWidget(String appBarTitle) => PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Container(
      height: SizeConfig.height * 20,
      decoration: BoxDecoration(
        color: Colors.yellowAccent[700],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppConstants.kPadding20),
          bottomRight: Radius.circular(AppConstants.kPadding20),
        ),
      ),
      child: SafeArea(
          child: Row(
        children: [
          SizedBox(
            width: SizeConfig.width * 2,
          ),
          const BackIconWidget(),
          SizedBox(
            width: SizeConfig.width * 3,
          ),
          Text(
            appBarTitle,
            style: TextStyle(color: AppColors.kLightColor, fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ],
      )),
    ));
