import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/service/get_lpg_rest_area_service.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/service/lpg_rest_area_local_service.dart';

import '../../model/api_response.dart';

class LpgRestAreaRepository {
  /// LPG 휴게소 조회
  Future<ApiResponseModel> getLpgRestArea({
    required int page,
    required int size,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    /// 인터넷 연결이 안된 경우 로컬 캐시에서 데이터 조회
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return await LpgRestAreaLocalService().getLpgRestArea(page);
    }

    final ApiResponseModel res =
        await GetLpgRestArea(page: page, size: size).start();

    // todo 저장 에러 처리
    await LpgRestAreaLocalService().saveLpgRestArea(res, page);

    return res;
  }
}
