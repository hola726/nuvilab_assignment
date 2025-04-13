// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lpg_rest_area_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LpgRestAreaModel _$LpgRestAreaModelFromJson(Map<String, dynamic> json) =>
    _LpgRestAreaModel(
      routeCode: json['routeCode'] as String,
      serviceAreaCode: json['serviceAreaCode'] as String,
      routeName: json['routeName'] as String,
      serviceAreaName: json['serviceAreaName'] as String,
      oilCompany: json['oilCompany'] as String?,
      location: json['location'] as String?,
      svarAddr: json['svarAddr'] as String?,
    );

Map<String, dynamic> _$LpgRestAreaModelToJson(_LpgRestAreaModel instance) =>
    <String, dynamic>{
      'routeCode': instance.routeCode,
      'serviceAreaCode': instance.serviceAreaCode,
      'routeName': instance.routeName,
      'serviceAreaName': instance.serviceAreaName,
      'oilCompany': instance.oilCompany,
      'location': instance.location,
      'svarAddr': instance.svarAddr,
    };
