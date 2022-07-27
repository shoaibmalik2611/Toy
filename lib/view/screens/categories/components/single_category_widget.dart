import 'package:flutter/material.dart';
import 'package:flutter_task/core/network/app_urls.dart';
import 'package:flutter_task/utils/app-constants/app_colors.dart';
import 'package:flutter_task/utils/app-constants/app_constants.dart';
import 'package:flutter_task/utils/screen-config/screen_config.dart';

class SingleCategoryWidget extends StatelessWidget {
  final String categoryName, categoryImage;

  const SingleCategoryWidget({Key? key, required this.categoryName, required this.categoryImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.height * 25,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: SizeConfig.height * 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppConstants.kPadding15),
                color: AppColors.kBodyTextColorLight,
              ),
            ),
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  '${AppUrls.imageUrl}$categoryImage',
                  height: SizeConfig.height * 15,
                ),
              ),
              SizedBox(
                height: SizeConfig.height * 1,
              ),
              Container(
                height: SizeConfig.height * 5,
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.kPadding25),
                child: Text(
                  categoryName,
                  style: const TextStyle(color: AppColors.kLightColor, fontWeight: FontWeight.w700, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.kLightColor,
              )
            ],
          )
        ],
      ),
    );
  }
}
