import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/lpg_rest_area_repository.dart';

final lpgRestAreaPageProvider = StateNotifierProvider.autoDispose<
  LpgRestAreaPageNotifier,
  LpgRestAreaPageState
>((ref) {
  return LpgRestAreaPageNotifier(
    lpgRestAreaRepository: LpgRestAreaRepository(),
  );
});

class LpgRestAreaPageNotifier extends StateNotifier<LpgRestAreaPageState> {
  final LpgRestAreaRepository lpgRestAreaRepository;
  LpgRestAreaPageNotifier({required this.lpgRestAreaRepository})
    : super(LpgRestAreaPageState(count: 0, isLoading: false));
}

class LpgRestAreaPageState {
  int count;
  bool isLoading;
  LpgRestAreaPageState({required this.count, required this.isLoading});

  LpgRestAreaPageState copyWith({int? count, bool? isLoading}) {
    return LpgRestAreaPageState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
