import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/lpg_rest_area_repository.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/model/lpg_rest_area_model.dart';
import 'package:nuvilab_assignment/model/api_response.dart';

import '../../../data/lpg_rest_area/service/lpg_rest_area_local_service.dart';

final lpgRestAreaPagingProvider = StateNotifierProvider.autoDispose<
  LpgRestAreaPagingController,
  PagingController<int, LpgRestAreaModel>
>((ref) {
  return LpgRestAreaPagingController(
    lpgRestAreaRepository: LpgRestAreaRepository(),
  );
});

/// 홈 페이지 페이지 네이션을 위한 컨트롤러
class LpgRestAreaPagingController
    extends StateNotifier<PagingController<int, LpgRestAreaModel>> {
  final LpgRestAreaRepository lpgRestAreaRepository;
  LpgRestAreaPagingController({required this.lpgRestAreaRepository})
    : super(PagingController(firstPageKey: 0)) {
    state.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final ApiResponseModel res = await lpgRestAreaRepository.getLpgRestArea(
        page: pageKey,
        size: 20,
      );

      final newItems = res.list;

      final isLastPage = res.pageSize == res.pageNo;

      if (isLastPage) {
        state.appendLastPage(newItems);
      } else {
        state.appendPage(newItems, pageKey + 1);
      }
    } on CacheFailure catch (e) {
      /// 캐시 관련 에러처리
      state.error = e.message;
      state.appendLastPage([]);
    } on DioException catch (e) {
      /// http상태별로 에러 처리
      state.error = e.error;
    } catch (error) {
      /// nullable 데이터나 예상치 못한 에러 처리
      state.error = "예상치 못한 에러가 발생하였습니다.";
    }
  }
}
