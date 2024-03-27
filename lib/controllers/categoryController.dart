import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';

import '../screens/Home/snackBar.dart';

class CategoryController extends GetxController {
  RxList<dynamic> categorys = <dynamic>[].obs;

  @override
  void onInit() async {
    super.onInit();
    fetchCategory();
  }

  void deleteCategory(String id) async {
    var token = await SessionManager().get('token');
    token = token.toString();
    Dio dioInstance = Dio();
    try {
      // Send the form data using POST request
      var res = await dioInstance.delete(
          'http://192.168.43.119:5001/api/Category/DeleteCategory/$id',
          data: {},
          options: Options(headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          }));

      for (var i = 0; i < categorys.length; i++) {
        if (categorys[i]['_id'] == id) {
          categorys.removeAt(i);
        }
      }
      print(categorys);
      // Handle the response
      // ...
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        snackBar(title: e.response!.data['message'] + '!', color: Colors.red);
      }
    }
  }

  void updateCategory(String id, String categoryName) async {
    var token = await SessionManager().get('token');
    token = token.toString();
    Dio dioInstance = Dio();
    try {
      // Send the form data using POST request
      var res = await dioInstance.patch(
          'http://192.168.43.119:5001/api/Category/UpdateCategory/$id',
          data: {"categoryName": "hilina"},
          options: Options(headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          }));

      for (var i = 0; i < categorys.length; i++) {
        if (categorys[i]['_id'] == id) {
          categorys[i] = {...categorys[i], "categoryName": "hilina"};
        }
      }
      print(categorys);
      // Handle the response
      // ...
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        snackBar(title: e.response!.data['message'] + '!', color: Colors.red);
      }
    }
  }

  void fetchCategory() async {
    var token = await SessionManager().get('token');
    token = token.toString();
    Dio dioInstance = Dio();
    try {
      // Send the form data using POST request
      var res = await dioInstance.get(
          'http://192.168.43.119:5001/api/Category/AllCategory',
          data: {},
          options: Options(headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token"
          }));

      categorys.value = res.data;
      print(categorys);
      // Handle the response
      // ...
    } on DioException catch (e) {
      if (e.response!.statusCode == 422) {
        snackBar(title: e.response!.data['message'] + '!', color: Colors.red);
      }
    }
  }
}
