import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

/// Table for storing conversion history
class ConversionHistories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get category => text()();
  TextColumn get fromUnit => text()();
  TextColumn get toUnit => text()();
  RealColumn get fromValue => real()();
  RealColumn get toValue => real()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
}

/// Database class with DAO
@DriftDatabase(tables: [ConversionHistories])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // DAO Methods for CRUD operations

  /// Watch all conversion history (reactive stream)
  Stream<List<ConversionHistory>> watchAllHistory() {
    return (select(conversionHistories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  /// Get all conversion history as a future
  Future<List<ConversionHistory>> getAllHistory() {
    return (select(conversionHistories)
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)
          ]))
        .get();
  }

  /// Insert a new conversion history entry
  Future<int> insertHistory(ConversionHistoriesCompanion entry) {
    return into(conversionHistories).insert(entry);
  }

  /// Delete a specific history entry
  Future<int> deleteHistory(int id) {
    return (delete(conversionHistories)..where((t) => t.id.equals(id))).go();
  }

  /// Clear all history
  Future<int> clearAllHistory() {
    return delete(conversionHistories).go();
  }

  /// Get history for a specific category
  Stream<List<ConversionHistory>> watchHistoryByCategory(String category) {
    return (select(conversionHistories)
          ..where((t) => t.category.equals(category))
          ..orderBy([
            (t) => OrderingTerm(expression: t.timestamp, mode: OrderingMode.desc)
          ]))
        .watch();
  }
}

/// Opens the database connection
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'unit_converter.db'));
    return NativeDatabase(file);
  });
}
