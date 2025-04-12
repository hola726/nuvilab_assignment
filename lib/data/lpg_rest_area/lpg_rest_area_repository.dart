import 'package:nuvilab_assignment/data/lpg_rest_area/service/get_lpg_rest_area_service.dart';

import '../../model/api_response.dart';

class LpgRestAreaRepository {
  getLpgRestArea({required int page, required int size}) async {
    final ApiResponseModel res =
        await GetLpgRestArea(page: page, size: size).start();
  }
}
