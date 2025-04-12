import 'package:dio/src/response.dart';
import 'package:nuvilab_assignment/constant/constant.dart';
import 'package:nuvilab_assignment/core/base_service.dart';

import '../../../model/api_response.dart';

/// LPG 휴게소 조회 api
class GetLpgRestArea extends BaseService {
  GetLpgRestArea({required this.page, required this.size});
  final int page;
  final int size;

  @override
  Future<Response<dynamic>> request() {
    return fetchGet();
  }

  @override
  String setUrl() {
    return 'business/lpgServiceAreaInfo?pageNo=$page&numOfRows=$size&type=json&key=${Constant.serviceKey}';
  }

  @override
  ApiResponseModel success(body) {
    return ApiResponseModel.fromJson(body);
  }
}
