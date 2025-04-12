// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lpg_rest_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LpgRestAreaModel {

 String get routeCode;// 노선코드
 String get serviceAreaCode;// 휴게소/주유소코드
 String get routeName;// 노선명
 String get serviceAreaName;// 휴게소/주유소명
 String get oilCompany;// 정유사
 String get location;// 위치
 String? get svarAddr;
/// Create a copy of LpgRestAreaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LpgRestAreaModelCopyWith<LpgRestAreaModel> get copyWith => _$LpgRestAreaModelCopyWithImpl<LpgRestAreaModel>(this as LpgRestAreaModel, _$identity);

  /// Serializes this LpgRestAreaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LpgRestAreaModel&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.serviceAreaCode, serviceAreaCode) || other.serviceAreaCode == serviceAreaCode)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.serviceAreaName, serviceAreaName) || other.serviceAreaName == serviceAreaName)&&(identical(other.oilCompany, oilCompany) || other.oilCompany == oilCompany)&&(identical(other.location, location) || other.location == location)&&(identical(other.svarAddr, svarAddr) || other.svarAddr == svarAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,routeCode,serviceAreaCode,routeName,serviceAreaName,oilCompany,location,svarAddr);

@override
String toString() {
  return 'LpgRestAreaModel(routeCode: $routeCode, serviceAreaCode: $serviceAreaCode, routeName: $routeName, serviceAreaName: $serviceAreaName, oilCompany: $oilCompany, location: $location, svarAddr: $svarAddr)';
}


}

/// @nodoc
abstract mixin class $LpgRestAreaModelCopyWith<$Res>  {
  factory $LpgRestAreaModelCopyWith(LpgRestAreaModel value, $Res Function(LpgRestAreaModel) _then) = _$LpgRestAreaModelCopyWithImpl;
@useResult
$Res call({
 String routeCode, String serviceAreaCode, String routeName, String serviceAreaName, String oilCompany, String location, String? svarAddr
});




}
/// @nodoc
class _$LpgRestAreaModelCopyWithImpl<$Res>
    implements $LpgRestAreaModelCopyWith<$Res> {
  _$LpgRestAreaModelCopyWithImpl(this._self, this._then);

  final LpgRestAreaModel _self;
  final $Res Function(LpgRestAreaModel) _then;

/// Create a copy of LpgRestAreaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? routeCode = null,Object? serviceAreaCode = null,Object? routeName = null,Object? serviceAreaName = null,Object? oilCompany = null,Object? location = null,Object? svarAddr = freezed,}) {
  return _then(_self.copyWith(
routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,serviceAreaCode: null == serviceAreaCode ? _self.serviceAreaCode : serviceAreaCode // ignore: cast_nullable_to_non_nullable
as String,routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,serviceAreaName: null == serviceAreaName ? _self.serviceAreaName : serviceAreaName // ignore: cast_nullable_to_non_nullable
as String,oilCompany: null == oilCompany ? _self.oilCompany : oilCompany // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,svarAddr: freezed == svarAddr ? _self.svarAddr : svarAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _LpgRestAreaModel implements LpgRestAreaModel {
   _LpgRestAreaModel({required this.routeCode, required this.serviceAreaCode, required this.routeName, required this.serviceAreaName, required this.oilCompany, required this.location, this.svarAddr});
  factory _LpgRestAreaModel.fromJson(Map<String, dynamic> json) => _$LpgRestAreaModelFromJson(json);

@override final  String routeCode;
// 노선코드
@override final  String serviceAreaCode;
// 휴게소/주유소코드
@override final  String routeName;
// 노선명
@override final  String serviceAreaName;
// 휴게소/주유소명
@override final  String oilCompany;
// 정유사
@override final  String location;
// 위치
@override final  String? svarAddr;

/// Create a copy of LpgRestAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LpgRestAreaModelCopyWith<_LpgRestAreaModel> get copyWith => __$LpgRestAreaModelCopyWithImpl<_LpgRestAreaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LpgRestAreaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LpgRestAreaModel&&(identical(other.routeCode, routeCode) || other.routeCode == routeCode)&&(identical(other.serviceAreaCode, serviceAreaCode) || other.serviceAreaCode == serviceAreaCode)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&(identical(other.serviceAreaName, serviceAreaName) || other.serviceAreaName == serviceAreaName)&&(identical(other.oilCompany, oilCompany) || other.oilCompany == oilCompany)&&(identical(other.location, location) || other.location == location)&&(identical(other.svarAddr, svarAddr) || other.svarAddr == svarAddr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,routeCode,serviceAreaCode,routeName,serviceAreaName,oilCompany,location,svarAddr);

@override
String toString() {
  return 'LpgRestAreaModel(routeCode: $routeCode, serviceAreaCode: $serviceAreaCode, routeName: $routeName, serviceAreaName: $serviceAreaName, oilCompany: $oilCompany, location: $location, svarAddr: $svarAddr)';
}


}

/// @nodoc
abstract mixin class _$LpgRestAreaModelCopyWith<$Res> implements $LpgRestAreaModelCopyWith<$Res> {
  factory _$LpgRestAreaModelCopyWith(_LpgRestAreaModel value, $Res Function(_LpgRestAreaModel) _then) = __$LpgRestAreaModelCopyWithImpl;
@override @useResult
$Res call({
 String routeCode, String serviceAreaCode, String routeName, String serviceAreaName, String oilCompany, String location, String? svarAddr
});




}
/// @nodoc
class __$LpgRestAreaModelCopyWithImpl<$Res>
    implements _$LpgRestAreaModelCopyWith<$Res> {
  __$LpgRestAreaModelCopyWithImpl(this._self, this._then);

  final _LpgRestAreaModel _self;
  final $Res Function(_LpgRestAreaModel) _then;

/// Create a copy of LpgRestAreaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? routeCode = null,Object? serviceAreaCode = null,Object? routeName = null,Object? serviceAreaName = null,Object? oilCompany = null,Object? location = null,Object? svarAddr = freezed,}) {
  return _then(_LpgRestAreaModel(
routeCode: null == routeCode ? _self.routeCode : routeCode // ignore: cast_nullable_to_non_nullable
as String,serviceAreaCode: null == serviceAreaCode ? _self.serviceAreaCode : serviceAreaCode // ignore: cast_nullable_to_non_nullable
as String,routeName: null == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String,serviceAreaName: null == serviceAreaName ? _self.serviceAreaName : serviceAreaName // ignore: cast_nullable_to_non_nullable
as String,oilCompany: null == oilCompany ? _self.oilCompany : oilCompany // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,svarAddr: freezed == svarAddr ? _self.svarAddr : svarAddr // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
