import 'package:dio/dio.dart';
import 'package:nuvilab_assignment/core/api_client.dart';

import '../model/api_response.dart';

abstract class BaseService<T> {
  final Dio dio = ApiClient().dio;
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

    /// dio interceptor에서 http status check
    /// 성공시 success() 호출
    return success(response.data);
  }
}
