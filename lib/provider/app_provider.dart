import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 전역 상태 관리
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
