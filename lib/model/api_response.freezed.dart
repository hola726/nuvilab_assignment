// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponseModel {

 String get code; String get message; int get pageSize; int get numOfRows; int get pageNo; int get count; List<LpgRestAreaModel> get list;
/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseModelCopyWith<ApiResponseModel> get copyWith => _$ApiResponseModelCopyWithImpl<ApiResponseModel>(this as ApiResponseModel, _$identity);

  /// Serializes this ApiResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other.list, list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,pageSize,numOfRows,pageNo,count,const DeepCollectionEquality().hash(list));

@override
String toString() {
  return 'ApiResponseModel(code: $code, message: $message, pageSize: $pageSize, numOfRows: $numOfRows, pageNo: $pageNo, count: $count, list: $list)';
}


}

/// @nodoc
abstract mixin class $ApiResponseModelCopyWith<$Res>  {
  factory $ApiResponseModelCopyWith(ApiResponseModel value, $Res Function(ApiResponseModel) _then) = _$ApiResponseModelCopyWithImpl;
@useResult
$Res call({
 String code, String message, int pageSize, int numOfRows, int pageNo, int count, List<LpgRestAreaModel> list
});




}
/// @nodoc
class _$ApiResponseModelCopyWithImpl<$Res>
    implements $ApiResponseModelCopyWith<$Res> {
  _$ApiResponseModelCopyWithImpl(this._self, this._then);

  final ApiResponseModel _self;
  final $Res Function(ApiResponseModel) _then;

/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? pageSize = null,Object? numOfRows = null,Object? pageNo = null,Object? count = null,Object? list = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,list: null == list ? _self.list : list // ignore: cast_nullable_to_non_nullable
as List<LpgRestAreaModel>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiResponseModel implements ApiResponseModel {
   _ApiResponseModel({required this.code, required this.message, required this.pageSize, required this.numOfRows, required this.pageNo, required this.count, required final  List<LpgRestAreaModel> list}): _list = list;
  factory _ApiResponseModel.fromJson(Map<String, dynamic> json) => _$ApiResponseModelFromJson(json);

@override final  String code;
@override final  String message;
@override final  int pageSize;
@override final  int numOfRows;
@override final  int pageNo;
@override final  int count;
 final  List<LpgRestAreaModel> _list;
@override List<LpgRestAreaModel> get list {
  if (_list is EqualUnmodifiableListView) return _list;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_list);
}


/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseModelCopyWith<_ApiResponseModel> get copyWith => __$ApiResponseModelCopyWithImpl<_ApiResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponseModel&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.count, count) || other.count == count)&&const DeepCollectionEquality().equals(other._list, _list));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,pageSize,numOfRows,pageNo,count,const DeepCollectionEquality().hash(_list));

@override
String toString() {
  return 'ApiResponseModel(code: $code, message: $message, pageSize: $pageSize, numOfRows: $numOfRows, pageNo: $pageNo, count: $count, list: $list)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseModelCopyWith<$Res> implements $ApiResponseModelCopyWith<$Res> {
  factory _$ApiResponseModelCopyWith(_ApiResponseModel value, $Res Function(_ApiResponseModel) _then) = __$ApiResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, int pageSize, int numOfRows, int pageNo, int count, List<LpgRestAreaModel> list
});




}
/// @nodoc
class __$ApiResponseModelCopyWithImpl<$Res>
    implements _$ApiResponseModelCopyWith<$Res> {
  __$ApiResponseModelCopyWithImpl(this._self, this._then);

  final _ApiResponseModel _self;
  final $Res Function(_ApiResponseModel) _then;

/// Create a copy of ApiResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? pageSize = null,Object? numOfRows = null,Object? pageNo = null,Object? count = null,Object? list = null,}) {
  return _then(_ApiResponseModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,list: null == list ? _self._list : list // ignore: cast_nullable_to_non_nullable
as List<LpgRestAreaModel>,
  ));
}


}

// dart format on
