import '../../models/category_model.dart';
import '../response/response_handler.dart';
import 'app_urls.dart';

class HTTPManager {
  final ResponseHandler _handler = ResponseHandler();

  Future<List<CategoryModel>> getAppCategories() async {
    try {
      dynamic response = await _handler.getResponse(AppUrls.categoryUrl, false);
      return categoryFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CategoryModel>> getSubCategories(int id) async {
    try {
      dynamic response = await _handler.getResponse('${AppUrls.subCategoryUrl}$id', false);
      return categoryFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

// Future<UserViewModel> loginUser(Map<String, String> parameters) async {
//   final url = ApplicationURLs.LOGIN_URL;
//   var head = Map<String, String>();
//   head['content-type'] = 'application/json';
//   final Response response = await _handler.post(url, parameters, false);
//   UserViewModel model = UserViewModel.fromAPI(response.data['user']);
//   model.token = response.data['token'] ?? '';
//   return model;
// }
}
