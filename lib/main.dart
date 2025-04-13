import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nuvilab_assignment/provider/app_provider.dart';
import 'package:nuvilab_assignment/ui/home/page/home_page.dart';
import 'package:nuvilab_assignment/ui/lpg_rest_area/page/lpg_rest_area_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _handleHive();
  await _handleFcm();
  _handleCrashlytics();

  runApp(ProviderScope(child: const MyApp()));
}

void _handleCrashlytics() async {
  FlutterError.onError = (errorDetails) {
    /// 프레임워크 내에서 발생하는 모든 오류를 자동으로 포착
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  /// 비동기 오류를 포착
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

Future<void> _handleHive() async {
  await Hive.initFlutter();
  await Hive.openBox('lpg_rest_area');
}

Future<void> _handleFcm() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  /// 앱이 포그라운드 상태일 때 알림 수신
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // todo 추후 포그라운드 알림 처리 및 딥링크 처리
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // todo 추후 백그라운드 알림 처리 및 딥링크 처리
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/lpg_rest_area_page': (context) => LpgRestAreaPage(),
      },
      navigatorKey: navigatorKey,
    );
  }
}
