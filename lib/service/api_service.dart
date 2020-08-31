
import 'dart:convert';

import 'package:apitest/model/api_model.dart';
import 'package:apitest/utils/api_details.dart';
import 'package:http/http.dart' as http;

class ApiService{


  Future<ApiModel> getData() async {
    var response = await http.get(ApiDetails.apiUrl);

    if(response.statusCode == 200){
      return ApiModel.fromJsonMap(json.decode(response.body));
    }else{
      throw Exception("getData (response error code) [APISERVICE] : "+response.statusCode.toString());
    }
  }




}