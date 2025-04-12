import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuvilab_assignment/provider/app_provider.dart';
import 'package:nuvilab_assignment/ui/home/page/home_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        /// nuvilab primary 컬러 설정
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF56bb40)),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          /// nuvilab primary 컬러 설정
          seedColor: Color(0xFF56bb40),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: themeMode,
      home: const HomePage(),
    );
  }
}
