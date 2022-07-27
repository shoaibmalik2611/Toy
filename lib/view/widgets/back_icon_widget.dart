import 'package:flutter/material.dart';

import '../../utils/app-constants/app_colors.dart';

class BackIconWidget extends StatelessWidget {
  const BackIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back,
        color: AppColors.kLightColor,
      ));
}
