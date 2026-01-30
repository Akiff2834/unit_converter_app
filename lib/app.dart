import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router/app_router.dart';
import 'providers/converter_provider.dart';
import 'providers/history_provider.dart';
import 'providers/theme_provider.dart';
import 'di/service_locator.dart';

/// Main application widget
class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(
          value: getIt<ThemeProvider>(),
        ),
        ChangeNotifierProvider<ConverterProvider>.value(
          value: getIt<ConverterProvider>(),
        ),
        ChangeNotifierProvider<HistoryProvider>.value(
          value: getIt<HistoryProvider>(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            title: 'Unit Converter',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.themeData,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
