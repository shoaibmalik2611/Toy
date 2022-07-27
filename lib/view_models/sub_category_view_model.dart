import 'package:flutter/cupertino.dart';

import '../core/network/http_manager.dart';
import '../core/response/api_reponse.dart';
import '../models/category_model.dart';

class SubCategoryViewModel extends ChangeNotifier {
  final _httpManager = HTTPManager();
  ApiResponse<List<CategoryModel>> subCategoryResponse = ApiResponse.loading();

  void _setSubCategory(ApiResponse<List<CategoryModel>> response) {
    subCategoryResponse = response;
    notifyListeners();
  }

  Future<void> fetchSubCategories(int categoryId) async {
    _setSubCategory(ApiResponse.loading());
    _httpManager
        .getSubCategories(categoryId)
        .then((value) => _setSubCategory(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setSubCategory(ApiResponse.error(error.toString())));
  }
}
