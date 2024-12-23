// uygulamada sayfalari ve navigasyon islemlerini burada tanimlicaz

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/category_screen.dart';
import 'package:go_router/go_router.dart';
import '../screens/history_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/search_screen.dart';
import '../screens/voice_screen.dart';
import '../screens/category_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/', // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/voice',
      builder: (context, state) => const VoiceScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => const HistoryScreen(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;

        if (extra == null) {
          return Scaffold(
            body: Center(
              child: Text('Kategori bilgisi bulunamadı!'),
            ),
          );
        }

        final categoryName = extra['categoryName'] as String;
        final categoryColor = extra['categoryColor'] as Color;

        return CategoryScreen(
          categoryName: categoryName,
          categoryColor: categoryColor,
        );
      },
    ),
  ],
);