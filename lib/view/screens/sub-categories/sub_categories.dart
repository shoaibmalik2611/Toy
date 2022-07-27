import 'package:flutter/material.dart';
import 'package:flutter_task/core/network/app_urls.dart';
import 'package:flutter_task/utils/app-constants/app_constants.dart';
import 'package:flutter_task/utils/app-constants/app_icons.dart';
import 'package:flutter_task/utils/screen-config/screen_config.dart';
import 'package:flutter_task/view/widgets/app_bar_widget.dart';
import 'package:flutter_task/view_models/sub_category_view_model.dart';
import 'package:provider/provider.dart';

import '../../../enums/response_status.dart';
import '../../../models/category_model.dart';
import '../../../utils/app-constants/app_colors.dart';
import '../../widgets/loading_widget.dart';

class SubCategories extends StatefulWidget {
  final CategoryModel categoryData;

  const SubCategories({Key? key, required this.categoryData}) : super(key: key);

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  final SubCategoryViewModel _subCategoriesVM = SubCategoryViewModel();

  @override
  void initState() {
    _subCategoriesVM.fetchSubCategories(widget.categoryData.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Sub Categories'),
      body: Container(
        height: SizeConfig.height * 100,
        width: SizeConfig.width * 100,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.kPadding15),
        child: _body(),
      ),
    );
  }

  Widget _body() => ChangeNotifierProvider<SubCategoryViewModel>(
        create: (BuildContext context) => _subCategoriesVM,
        child: Consumer<SubCategoryViewModel>(builder: (context, viewModel, _) {
          switch (viewModel.subCategoryResponse.status) {
            case ResponseStatus.loading:
              return const LoadingWidget();
            case ResponseStatus.error:
              return ErrorWidget(viewModel.subCategoryResponse.message ?? "Something Went Wrong");
            case ResponseStatus.complete:
              return _subCategories(
                viewModel.subCategoryResponse.data!,
              );
            default:
          }
          return Container();
        }),
      );

  Widget _subCategories(List<CategoryModel> subCategories) => Column(
        children: [
          SizedBox(
            height: SizeConfig.height * 3,
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: SizeConfig.width * 100,
                  height: SizeConfig.height * 8,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.kPadding10, vertical: AppConstants.kPadding15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppConstants.kPadding15), color: Colors.lightBlue),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.categoryData.title!.en!,
                      style: const TextStyle(color: AppColors.kLightColor, fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Image.network(
                    '${AppUrls.imageUrl}${widget.categoryData.image}',
                    height: SizeConfig.height * 10,
                  ))
            ],
          ),
          SizedBox(
            height: SizeConfig.height * 3,
          ),
          Column(
              children: subCategories
                  .map((e) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppConstants.kPadding5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.title!.en!,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                Image.asset(
                                  AppIcons.doubleArrowIcon,
                                  height: SizeConfig.height * 3,
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColors.kLightGreyColor,
                            thickness: SizeConfig.height * .1,
                          )
                        ],
                      ))
                  .toList())
        ],
      );
}
