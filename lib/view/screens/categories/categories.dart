import 'package:flutter/material.dart';
import 'package:flutter_task/enums/response_status.dart';
import 'package:flutter_task/utils/screen-config/screen_config.dart';
import 'package:flutter_task/view/screens/categories/components/categories_grid_view_widget.dart';
import 'package:flutter_task/view/widgets/app_bar_widget.dart';
import 'package:flutter_task/view_models/categories_view_model.dart';
import 'package:provider/provider.dart';

import '../../widgets/loading_widget.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final CategoriesViewModel _categoriesVM = CategoriesViewModel();

  @override
  void initState() {
    _categoriesVM.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Categories'),
      body: SizedBox(
        height: SizeConfig.height * 100,
        width: SizeConfig.width * 100,
        child: _body(),
      ),
    );
  }

  Widget _body() => ChangeNotifierProvider<CategoriesViewModel>(
        create: (BuildContext context) => _categoriesVM,
        child: Consumer<CategoriesViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.categoriesResponse.status) {
            case ResponseStatus.loading:
              return const LoadingWidget();
            case ResponseStatus.error:
              return ErrorWidget(viewModel.categoriesResponse.message ?? "Something Went Wrong");
            case ResponseStatus.complete:
              return CategoriesGridViewWidget(
                categories: viewModel.categoriesResponse.data!,
              );
            default:
          }
          return Container();
        }),
      );
}
