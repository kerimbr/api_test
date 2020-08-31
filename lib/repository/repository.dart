import 'package:apitest/locator.dart';
import 'package:apitest/model/api_model.dart';
import 'package:apitest/service/api_service.dart';

class Repository {
  ApiService _apiService = getIt<ApiService>();

  Future<ApiModel> getData() async {
    var result = await _apiService.getData();
    return result;
  }




}
