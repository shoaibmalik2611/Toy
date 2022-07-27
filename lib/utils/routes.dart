import 'package:flutter/material.dart';
import 'package:flutter_task/view/screens/categories/categories.dart';
import 'package:flutter_task/view/screens/sub-categories/sub_categories.dart';

import '../models/category_model.dart';

class AppRoutes {
  AppRoutes();

  static const String rCategories = '/categories';
  static const String rSubcategory = '/subCategories';
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.rCategories:
        return MaterialPageRoute(builder: (_) => const Categories());
      case AppRoutes.rSubcategory:
        return MaterialPageRoute(
            builder: (_) => SubCategories(
                  categoryData: args as CategoryModel,
                ));
      default:
        return null;
    }
  }
}
