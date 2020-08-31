
import 'package:apitest/locator.dart';
import 'package:apitest/model/api_model.dart';
import 'package:apitest/repository/repository.dart';
import 'package:flutter/material.dart';


enum ViewState { IDLE, BUSY }


class ViewModel with ChangeNotifier{

  Repository _repository = getIt<Repository>();
  ViewState _state = ViewState.IDLE;


  ViewState get state => _state;


  Future<ApiModel> getData() async {
    var result = await _repository.getData();
    return result;
  }



}