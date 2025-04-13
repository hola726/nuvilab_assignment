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
      onError: onNetworkError,
    );
  }

  /// api 요청 실패시 에러 처리
  void onNetworkError(DioException e, ErrorInterceptorHandler handler) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      /// 인터넷 연결이 안된 경우 에러 처리
      e = DioException(
        requestOptions: e.requestOptions,
        type: DioExceptionType.connectionError,
        error: '인터넷 연결이 없습니다.',
      );
      return handler.reject(e);
    }

    final options = e.requestOptions;
    // 재시도 횟수 확인
    int retries = options.extra['retries'] ?? 0;
    const maxRetries = 5; // 최대 재시도 횟수

    // 타임아웃 또는 서버 오류(5xx, 429) 시 재시도
    if ((e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.receiveTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            (e.response != null &&
                (e.response!.statusCode == 429 ||
                    e.response!.statusCode == 500 ||
                    e.response!.statusCode == 503))) &&
        retries < maxRetries) {
      retries++;
      options.extra['retries'] = retries;

      // 지수 백오프 대기 시간 계산 (2^retries 초)
      final delay = Duration(milliseconds: (1 << retries) * 2000);
      await Future.delayed(delay);

      try {
        // 재시도 요청
        final response = await dio.request(
          options.path,
          data: options.data,
          queryParameters: options.queryParameters,
          options: Options(method: options.method, headers: options.headers),
        );
        return handler.resolve(response);
      } catch (retryError) {
        // 재시도 실패 시 오류 업데이트
        e = DioException(
          requestOptions: options,
          error: _getErrorMessage(e.response?.statusCode),
          type: e.type,
          response: e.response,
        );
        return handler.reject(e);
      }
    }
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
        return '알 수 없는 오류가 발생했습니다. 상태 코드: $statusCode';
    }
  }
}
