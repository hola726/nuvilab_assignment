import 'package:dio/dio.dart';
import 'package:nuvilab_assignment/constant/constant.dart';

import '../model/api_response.dart';

abstract class BaseService<T> {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: Constant.baseUrl,
      headers: {'Content-Type': 'application/json'},
    ),
  );
  String _url = "";

  Future<Response<dynamic>> request();
  String setUrl();
  ApiResponseModel success(Map<String, dynamic> body);

  Future<Response<dynamic>> fetchGet() {
    return dio.get(_url);
  }

  Future<Response<dynamic>> fetchPost(Map<String, dynamic> body) {
    return dio.post(_url, data: body);
  }

  Future<Response<dynamic>> fetchPut(Map<String, dynamic> body) {
    return dio.put(_url, data: body);
  }

  Future<Response<dynamic>> fetchDelete(Map<String, dynamic> body) {
    return dio.delete(_url, data: body);
  }

  Future<dynamic> start() async {
    _url = setUrl();

    Response<dynamic> response = await request();

    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 204 ||
        response.statusCode == 400 ||
        response.statusCode == 404 ||
        response.statusCode == 403 ||
        response.statusCode == 500 ||
        response.statusCode == 501 ||
        response.statusCode == 502) {
      return success(response.data);
    }
  }
}
