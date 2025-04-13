import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/lpg_rest_area/model/lpg_rest_area_model.dart';

part 'api_response.g.dart';
part 'api_response.freezed.dart';

/// api 응답 모델
@freezed
abstract class ApiResponseModel with _$ApiResponseModel {
  factory ApiResponseModel({
    required String code, // 결과
    required String message, // 결과 메시지
    required int pageSize, // 전체 페이지 수
    required int numOfRows, // 한 페이지당 출력 건수
    required int pageNo, // 출력 페이지 번호
    required int count, // 전체 결과 수
    required List<LpgRestAreaModel> list,
  }) = _ApiResponseModel;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseModelFromJson(json);
}
