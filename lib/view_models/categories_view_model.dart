import 'package:flutter/cupertino.dart';
import 'package:flutter_task/core/network/http_manager.dart';

import '../core/response/api_reponse.dart';
import '../models/category_model.dart';

class CategoriesViewModel extends ChangeNotifier {
  final _httpManager = HTTPManager();
  ApiResponse<List<CategoryModel>> categoriesResponse = ApiResponse.loading();

  void _setCategories(ApiResponse<List<CategoryModel>> response) {
    categoriesResponse = response;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _setCategories(ApiResponse.loading());
    _httpManager
        .getAppCategories()
        .then((value) => _setCategories(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setCategories(ApiResponse.error(error.toString())));
  }
}
