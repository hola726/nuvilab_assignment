import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import '../constant/constant.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() => _instance;

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {'Content-Type': 'application/json'},
      ),
    )..interceptors.add(getInterceptor);
  }

  /// dio interceptor
  InterceptorsWrapper get getInterceptor {
    return InterceptorsWrapper(
      onResponse: (res, handler) {
        /// api 요청 성공시 통과
        if (res.statusCode == 200) {
          return handler.next(res);
        } else {
          /// api 요청 실패시 status code별 에러 처리
          return handler.reject(
            DioException(
              requestOptions: res.requestOptions,
              response: res,
              type: DioExceptionType.badResponse,
              error: _getErrorMessage(res.statusCode),
            ),
          );
        }
      },
    );
  }

  static String _getErrorMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return '잘못된 요청입니다. 입력을 확인해주세요.';
      case 401:
        return '인증에 실패했습니다.';
      case 403:
        return '접근 권한이 없습니다. API 키를 확인해주세요.';
      case 404:
        return '요청한 데이터를 찾을 수 없습니다.';
      case 429:
        return '요청이 너무 많습니다. 잠시 후 다시 시도해주세요.';
      case 500:
        return '서버에 문제가 발생했습니다. 나중에 다시 시도해주세요.';
      case 503:
        return '서버가 점검 중입니다. 잠시 후 다시 시도해주세요.';
      default:
        return 'Unexpected error occurred.';
    }
  }
}
