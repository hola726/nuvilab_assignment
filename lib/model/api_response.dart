import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/lpg_rest_area/model/lpg_rest_area_model.dart';

part 'api_response.g.dart';
part 'api_response.freezed.dart';

/// api 응답 모델
@freezed
abstract class ApiResponseModel with _$ApiResponseModel {
  factory ApiResponseModel({
    required String code,
    required String message,
    required int pageSize,
    required int numOfRows,
    required int pageNo,
    required int count,
    required List<LpgRestAreaModel> list,
  }) = _ApiResponseModel;


  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
}
