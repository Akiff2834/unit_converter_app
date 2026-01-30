import 'package:flutter/foundation.dart';
import '../db/app_database.dart';
import '../repositories/conversion_history_repository.dart';

/// Provider for managing conversion history
class HistoryProvider extends ChangeNotifier {
  final ConversionHistoryRepository _repository;

  HistoryProvider(this._repository);

  /// Get history stream
  Stream<List<ConversionHistory>> get historyStream =>
      _repository.getHistoryStream();

  /// Delete a history item
  Future<void> deleteItem(int id) async {
    try {
      await _repository.deleteConversion(id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to delete history item: $e');
    }
  }

  /// Clear all history
  Future<void> clearAll() async {
    try {
      await _repository.clearAllHistory();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to clear history: $e');
    }
  }

  /// Get history for a specific category
  Stream<List<ConversionHistory>> getHistoryByCategory(String category) {
    return _repository.getHistoryByCategory(category);
  }
}
