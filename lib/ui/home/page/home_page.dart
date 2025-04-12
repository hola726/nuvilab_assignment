import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:nuvilab_assignment/data/lpg_rest_area/model/lpg_rest_area_model.dart';
import 'package:nuvilab_assignment/ui/home/provider/home_paging_provider.dart';
import 'package:nuvilab_assignment/ui/home/provider/home_provider.dart';

import '../../../provider/app_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  /// 세로 화면 위젯
  Widget _widgetPortrait(
    PagingController<int, LpgRestAreaModel> homePagingController,
  ) {
    return PagedListView<int, LpgRestAreaModel>(
      pagingController: homePagingController,
      builderDelegate: PagedChildBuilderDelegate<LpgRestAreaModel>(
        firstPageProgressIndicatorBuilder:
            (_) => const SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            ),
        newPageProgressIndicatorBuilder:
            (_) => const SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            ),
        firstPageErrorIndicatorBuilder:
            (_) => Center(
              child: Text(
                'Error loading data',
                style: TextStyle(color: Colors.red),
              ),
            ),
        newPageErrorIndicatorBuilder:
            (_) => Center(
              child: Text(
                'Error loading more data',
                style: TextStyle(color: Colors.red),
              ),
            ),
        noItemsFoundIndicatorBuilder:
            (_) => const Center(child: Text('No items found')),
        itemBuilder: (context, item, index) {
          return ListTile(
            title: Text(item.serviceAreaName),
            subtitle: Text(item.svarAddr ?? 'No address available'),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }

  /// 가로화면 위젯
  Widget _widgetLandScape(
    PagingController<int, LpgRestAreaModel> homePagingController,
  ) {
    return PagedGridView<int, LpgRestAreaModel>(
      pagingController: homePagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 1,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      builderDelegate: PagedChildBuilderDelegate<LpgRestAreaModel>(
        firstPageProgressIndicatorBuilder:
            (_) => const SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            ),
        newPageProgressIndicatorBuilder:
            (_) => const SizedBox(
              height: 80,
              child: Center(child: CircularProgressIndicator()),
            ),
        firstPageErrorIndicatorBuilder:
            (_) => Center(
              child: Text(
                'Error loading data',
                style: TextStyle(color: Colors.red),
              ),
            ),
        newPageErrorIndicatorBuilder:
            (_) => Center(
              child: Text(
                'Error loading more data',
                style: TextStyle(color: Colors.red),
              ),
            ),
        noItemsFoundIndicatorBuilder:
            (_) => const Center(child: Text('No items found')),
        itemBuilder: (context, item, index) {
          return ListTile(
            title: Text(item.serviceAreaName),
            subtitle: Text(item.svarAddr ?? 'No address available'),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final homePagingController = ref.watch(homePagingProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LPG 휴게소'),
        actions: [
          Semantics(
            label: '다크 모드 전환',
            child: IconButton(
              icon: Icon(
                themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                // 테마 토글
                ref.read(themeModeProvider.notifier).state =
                    themeMode == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
              },
            ),
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          switch (orientation) {
            case Orientation.portrait:
              return _widgetPortrait(homePagingController);
            case Orientation.landscape:
              return _widgetLandScape(homePagingController);
          }
        },
      ),
    );
  }
}
