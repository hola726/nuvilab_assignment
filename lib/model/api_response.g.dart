// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponseModel _$ApiResponseModelFromJson(Map<String, dynamic> json) =>
    _ApiResponseModel(
      code: json['code'] as String,
      message: json['message'] as String,
      pageSize: (json['pageSize'] as num).toInt(),
      numOfRows: (json['numOfRows'] as num).toInt(),
      pageNo: (json['pageNo'] as num).toInt(),
      count: (json['count'] as num).toInt(),
      list:
          (json['list'] as List<dynamic>)
              .map((e) => LpgRestAreaModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$ApiResponseModelToJson(_ApiResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'pageSize': instance.pageSize,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'count': instance.count,
      'list': instance.list,
    };
