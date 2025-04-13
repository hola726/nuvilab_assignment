import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:nuvilab_assignment/model/api_response.dart';

/// LPG 휴게소 local 캐시 서비스
class LpgRestAreaLocalService {
  final Box _box = Hive.box('lpg_rest_area');

  // 페이지별 데이터 저장
  Future<void> saveLpgRestArea(ApiResponseModel item, int page) async {
    try {
      await _box.put('lpg_rest_area_$page', jsonEncode(item.toJson()));
    } catch (e) {
      throw CacheFailure('데이터 저장에 실패했습니다.');
    }
  }

  // 페이지별 데이터 조회
  Future<ApiResponseModel> getLpgRestArea(int page) async {
    try {
      final json = jsonDecode(_box.get('lpg_rest_area_$page'));
      if (json == null) {
        throw CacheFailure('캐시된 데이터가 없습니다.');
      }
      return ApiResponseModel.fromJson(json);
    } catch (e) {
      throw CacheFailure('로컬 데이터를 불러오지 못했습니다.');
    }
  }

  // 페이지별 캐시 삭제
  Future<void> clearLpgRestArea(int page) async {
    try {
      await _box.delete('lpg_rest_area_$page');
    } catch (e) {
      throw CacheFailure('캐시 삭제에 실패했습니다.');
    }
  }

  // 모든 캐시 삭제
  Future<void> clearAllLpgRestArea() async {
    try {
      await _box.clear();
    } catch (e) {
      throw CacheFailure('모든 캐시 삭제에 실패했습니다.');
    }
  }
}

class CacheFailure implements Exception {
  final String message;
  CacheFailure(this.message);
}
