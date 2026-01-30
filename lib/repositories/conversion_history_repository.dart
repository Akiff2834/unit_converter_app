import '../db/app_database.dart';
import 'package:drift/drift.dart' as drift;

/// Repository for managing conversion history
/// Abstracts database access following the Repository Pattern
class ConversionHistoryRepository {
  final AppDatabase _database;

  ConversionHistoryRepository(this._database);

  /// Get a reactive stream of all conversion history
  Stream<List<ConversionHistory>> getHistoryStream() {
    return _database.watchAllHistory();
  }

  /// Get all history as a future
  Future<List<ConversionHistory>> getAllHistory() {
    return _database.getAllHistory();
  }

  /// Save a new conversion to history
  Future<int> saveConversion({
    required String category,
    required String fromUnit,
    required String toUnit,
    required double fromValue,
    required double toValue,
  }) {
    final entry = ConversionHistoriesCompanion(
      category: drift.Value(category),
      fromUnit: drift.Value(fromUnit),
      toUnit: drift.Value(toUnit),
      fromValue: drift.Value(fromValue),
      toValue: drift.Value(toValue),
      timestamp: drift.Value(DateTime.now()),
    );
    return _database.insertHistory(entry);
  }

  /// Delete a specific conversion from history
  Future<int> deleteConversion(int id) {
    return _database.deleteHistory(id);
  }

  /// Clear all conversion history
  Future<int> clearAllHistory() {
    return _database.clearAllHistory();
  }

  /// Get history for a specific category
  Stream<List<ConversionHistory>> getHistoryByCategory(String category) {
    return _database.watchHistoryByCategory(category);
  }
}
