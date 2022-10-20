

import 'dart:io';

import 'package:custom_ui/models/input_model.dart';
import 'package:dio/dio.dart';

class ApiClient {

  var dio = Dio();

  Future<List<InputModel>> getDynamicFields() async {
    try {
      Response response =
      await dio.get("https://dynamic-view-api.free.mockoapp.net/views");

      if (response.statusCode == HttpStatus.ok) {
        print("RESPONSEEEEEEEEEEEEEEE ${response.data}");
        return (response.data["dynamic_views"] as List?)
            ?.map((e) => InputModel.fromJson(e))
            .toList() ??
            [];
      }
      return [];
    } catch (error) {
      print(error);
      throw MyCustomFieldsError(errorText: error.toString());
    }
  }
}
class MyCustomFieldsError implements Exception{
  final String errorText;
  MyCustomFieldsError({required this.errorText});
}