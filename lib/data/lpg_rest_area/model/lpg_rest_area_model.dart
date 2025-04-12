import 'package:freezed_annotation/freezed_annotation.dart';

part 'lpg_rest_area_model.g.dart';
part 'lpg_rest_area_model.freezed.dart';

/// lpg 휴게소 모델
@freezed
abstract class LpgRestAreaModel with _$LpgRestAreaModel {
  factory LpgRestAreaModel({
    required String routeCode, // 노선코드
    required String serviceAreaCode, // 휴게소/주유소코드
    required String routeName, // 노선명
    required String serviceAreaName, // 휴게소/주유소명
    required String oilCompany, // 정유사
    required String location, // 위치
    String? svarAddr, // 휴게소주소
  }) = _LpgRestAreaModel;

  factory LpgRestAreaModel.fromJson(Map<String, dynamic> json) =>
      _$LpgRestAreaModelFromJson(json);
}
