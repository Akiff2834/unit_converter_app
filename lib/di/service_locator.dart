import 'package:get_it/get_it.dart';
import '../db/app_database.dart';
import '../services/api_service.dart';
import '../services/conversion_service.dart';
import '../repositories/conversion_history_repository.dart';
import '../repositories/currency_repository.dart';
import '../providers/converter_provider.dart';
import '../providers/history_provider.dart';
import '../providers/theme_provider.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Initialize dependency injection
Future<void> setupServiceLocator() async {
  // Database
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Services
  getIt.registerSingleton<ApiService>(ApiService());
  getIt.registerSingleton<ConversionService>(ConversionService());

  // Repositories
  getIt.registerSingleton<ConversionHistoryRepository>(
    ConversionHistoryRepository(getIt<AppDatabase>()),
  );
  getIt.registerSingleton<CurrencyRepository>(
    CurrencyRepository(getIt<ApiService>()),
  );

  // Providers
  getIt.registerSingleton<ConverterProvider>(
    ConverterProvider(
      getIt<ConversionService>(),
      getIt<CurrencyRepository>(),
      getIt<ConversionHistoryRepository>(),
    ),
  );
  getIt.registerSingleton<HistoryProvider>(
    HistoryProvider(getIt<ConversionHistoryRepository>()),
  );
  getIt.registerSingleton<ThemeProvider>(ThemeProvider());
}
