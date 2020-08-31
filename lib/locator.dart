import 'package:apitest/repository/repository.dart';
import 'package:apitest/service/api_service.dart';
import 'package:apitest/view_model/view_model.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;


void setup(){

  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => Repository());
  getIt.registerLazySingleton(() => ViewModel());
}