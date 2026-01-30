import 'package:go_router/go_router.dart';
import '../views/home_screen.dart';
import '../views/history_screen.dart';
import '../views/settings_screen.dart';

/// Application router configuration using GoRouter
class AppRouter {
  static const String home = '/';
  static const String history = '/history';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: history,
        name: 'history',
        builder: (context, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: settings,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => const HomeScreen(),
  );
}
