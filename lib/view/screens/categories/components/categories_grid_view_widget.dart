import 'package:flutter/material.dart';
import 'package:flutter_task/utils/app-constants/app_constants.dart';
import 'package:flutter_task/view/screens/categories/components/single_category_widget.dart';

import '../../../../models/category_model.dart';
import '../../../../utils/routes.dart';

class CategoriesGridViewWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoriesGridViewWidget({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kPadding15, vertical: AppConstants.kPadding20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: AppConstants.kPadding15,
            mainAxisSpacing: AppConstants.kPadding15,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, AppRoutes.rSubcategory, arguments: categories[index]),
            child: SingleCategoryWidget(
              categoryImage: categories[index].image!,
              categoryName: categories[index].title!.en!,
            ),
          );
        });
  }
}
