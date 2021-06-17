import 'package:cefops/Src/Interface/userInterface.dart';
import 'package:cefops/Src/models/courseModels.dart';
import 'package:dio/dio.dart';

// class repository implements IUserRepository{
//   final Dio dio;
//   repository(this.dio)
//
//   @override
//   Future<List<couseModel>> findAllUsers() async {
//    final response= await dio.get<List>("https://60c4f9c0ec8ef800175e0c4e.mockapi.io/teste1/testr");
// response.data!.map((e) => couseModel.fromJson(e)).toList();
//
//
//   }
// }