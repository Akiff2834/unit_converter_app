// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ConversionHistoriesTable extends ConversionHistories
    with TableInfo<$ConversionHistoriesTable, ConversionHistory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConversionHistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromUnitMeta = const VerificationMeta(
    'fromUnit',
  );
  @override
  late final GeneratedColumn<String> fromUnit = GeneratedColumn<String>(
    'from_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toUnitMeta = const VerificationMeta('toUnit');
  @override
  late final GeneratedColumn<String> toUnit = GeneratedColumn<String>(
    'to_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fromValueMeta = const VerificationMeta(
    'fromValue',
  );
  @override
  late final GeneratedColumn<double> fromValue = GeneratedColumn<double>(
    'from_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toValueMeta = const VerificationMeta(
    'toValue',
  );
  @override
  late final GeneratedColumn<double> toValue = GeneratedColumn<double>(
    'to_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    category,
    fromUnit,
    toUnit,
    fromValue,
    toValue,
    timestamp,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'conversion_histories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ConversionHistory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('from_unit')) {
      context.handle(
        _fromUnitMeta,
        fromUnit.isAcceptableOrUnknown(data['from_unit']!, _fromUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_fromUnitMeta);
    }
    if (data.containsKey('to_unit')) {
      context.handle(
        _toUnitMeta,
        toUnit.isAcceptableOrUnknown(data['to_unit']!, _toUnitMeta),
      );
    } else if (isInserting) {
      context.missing(_toUnitMeta);
    }
    if (data.containsKey('from_value')) {
      context.handle(
        _fromValueMeta,
        fromValue.isAcceptableOrUnknown(data['from_value']!, _fromValueMeta),
      );
    } else if (isInserting) {
      context.missing(_fromValueMeta);
    }
    if (data.containsKey('to_value')) {
      context.handle(
        _toValueMeta,
        toValue.isAcceptableOrUnknown(data['to_value']!, _toValueMeta),
      );
    } else if (isInserting) {
      context.missing(_toValueMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ConversionHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConversionHistory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      fromUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}from_unit'],
      )!,
      toUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}to_unit'],
      )!,
      fromValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}from_value'],
      )!,
      toValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}to_value'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
    );
  }

  @override
  $ConversionHistoriesTable createAlias(String alias) {
    return $ConversionHistoriesTable(attachedDatabase, alias);
  }
}

class ConversionHistory extends DataClass
    implements Insertable<ConversionHistory> {
  final int id;
  final String category;
  final String fromUnit;
  final String toUnit;
  final double fromValue;
  final double toValue;
  final DateTime timestamp;
  const ConversionHistory({
    required this.id,
    required this.category,
    required this.fromUnit,
    required this.toUnit,
    required this.fromValue,
    required this.toValue,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category'] = Variable<String>(category);
    map['from_unit'] = Variable<String>(fromUnit);
    map['to_unit'] = Variable<String>(toUnit);
    map['from_value'] = Variable<double>(fromValue);
    map['to_value'] = Variable<double>(toValue);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  ConversionHistoriesCompanion toCompanion(bool nullToAbsent) {
    return ConversionHistoriesCompanion(
      id: Value(id),
      category: Value(category),
      fromUnit: Value(fromUnit),
      toUnit: Value(toUnit),
      fromValue: Value(fromValue),
      toValue: Value(toValue),
      timestamp: Value(timestamp),
    );
  }

  factory ConversionHistory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConversionHistory(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      fromUnit: serializer.fromJson<String>(json['fromUnit']),
      toUnit: serializer.fromJson<String>(json['toUnit']),
      fromValue: serializer.fromJson<double>(json['fromValue']),
      toValue: serializer.fromJson<double>(json['toValue']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'fromUnit': serializer.toJson<String>(fromUnit),
      'toUnit': serializer.toJson<String>(toUnit),
      'fromValue': serializer.toJson<double>(fromValue),
      'toValue': serializer.toJson<double>(toValue),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  ConversionHistory copyWith({
    int? id,
    String? category,
    String? fromUnit,
    String? toUnit,
    double? fromValue,
    double? toValue,
    DateTime? timestamp,
  }) => ConversionHistory(
    id: id ?? this.id,
    category: category ?? this.category,
    fromUnit: fromUnit ?? this.fromUnit,
    toUnit: toUnit ?? this.toUnit,
    fromValue: fromValue ?? this.fromValue,
    toValue: toValue ?? this.toValue,
    timestamp: timestamp ?? this.timestamp,
  );
  ConversionHistory copyWithCompanion(ConversionHistoriesCompanion data) {
    return ConversionHistory(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      fromUnit: data.fromUnit.present ? data.fromUnit.value : this.fromUnit,
      toUnit: data.toUnit.present ? data.toUnit.value : this.toUnit,
      fromValue: data.fromValue.present ? data.fromValue.value : this.fromValue,
      toValue: data.toValue.present ? data.toValue.value : this.toValue,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ConversionHistory(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('fromUnit: $fromUnit, ')
          ..write('toUnit: $toUnit, ')
          ..write('fromValue: $fromValue, ')
          ..write('toValue: $toValue, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    category,
    fromUnit,
    toUnit,
    fromValue,
    toValue,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConversionHistory &&
          other.id == this.id &&
          other.category == this.category &&
          other.fromUnit == this.fromUnit &&
          other.toUnit == this.toUnit &&
          other.fromValue == this.fromValue &&
          other.toValue == this.toValue &&
          other.timestamp == this.timestamp);
}

class ConversionHistoriesCompanion extends UpdateCompanion<ConversionHistory> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> fromUnit;
  final Value<String> toUnit;
  final Value<double> fromValue;
  final Value<double> toValue;
  final Value<DateTime> timestamp;
  const ConversionHistoriesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.fromUnit = const Value.absent(),
    this.toUnit = const Value.absent(),
    this.fromValue = const Value.absent(),
    this.toValue = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  ConversionHistoriesCompanion.insert({
    this.id = const Value.absent(),
    required String category,
    required String fromUnit,
    required String toUnit,
    required double fromValue,
    required double toValue,
    this.timestamp = const Value.absent(),
  }) : category = Value(category),
       fromUnit = Value(fromUnit),
       toUnit = Value(toUnit),
       fromValue = Value(fromValue),
       toValue = Value(toValue);
  static Insertable<ConversionHistory> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? fromUnit,
    Expression<String>? toUnit,
    Expression<double>? fromValue,
    Expression<double>? toValue,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (fromUnit != null) 'from_unit': fromUnit,
      if (toUnit != null) 'to_unit': toUnit,
      if (fromValue != null) 'from_value': fromValue,
      if (toValue != null) 'to_value': toValue,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  ConversionHistoriesCompanion copyWith({
    Value<int>? id,
    Value<String>? category,
    Value<String>? fromUnit,
    Value<String>? toUnit,
    Value<double>? fromValue,
    Value<double>? toValue,
    Value<DateTime>? timestamp,
  }) {
    return ConversionHistoriesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      fromUnit: fromUnit ?? this.fromUnit,
      toUnit: toUnit ?? this.toUnit,
      fromValue: fromValue ?? this.fromValue,
      toValue: toValue ?? this.toValue,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (fromUnit.present) {
      map['from_unit'] = Variable<String>(fromUnit.value);
    }
    if (toUnit.present) {
      map['to_unit'] = Variable<String>(toUnit.value);
    }
    if (fromValue.present) {
      map['from_value'] = Variable<double>(fromValue.value);
    }
    if (toValue.present) {
      map['to_value'] = Variable<double>(toValue.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConversionHistoriesCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('fromUnit: $fromUnit, ')
          ..write('toUnit: $toUnit, ')
          ..write('fromValue: $fromValue, ')
          ..write('toValue: $toValue, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ConversionHistoriesTable conversionHistories =
      $ConversionHistoriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [conversionHistories];
}

typedef $$ConversionHistoriesTableCreateCompanionBuilder =
    ConversionHistoriesCompanion Function({
      Value<int> id,
      required String category,
      required String fromUnit,
      required String toUnit,
      required double fromValue,
      required double toValue,
      Value<DateTime> timestamp,
    });
typedef $$ConversionHistoriesTableUpdateCompanionBuilder =
    ConversionHistoriesCompanion Function({
      Value<int> id,
      Value<String> category,
      Value<String> fromUnit,
      Value<String> toUnit,
      Value<double> fromValue,
      Value<double> toValue,
      Value<DateTime> timestamp,
    });

class $$ConversionHistoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ConversionHistoriesTable> {
  $$ConversionHistoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fromUnit => $composableBuilder(
    column: $table.fromUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toUnit => $composableBuilder(
    column: $table.toUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fromValue => $composableBuilder(
    column: $table.fromValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get toValue => $composableBuilder(
    column: $table.toValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ConversionHistoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ConversionHistoriesTable> {
  $$ConversionHistoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fromUnit => $composableBuilder(
    column: $table.fromUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toUnit => $composableBuilder(
    column: $table.toUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fromValue => $composableBuilder(
    column: $table.fromValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get toValue => $composableBuilder(
    column: $table.toValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConversionHistoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConversionHistoriesTable> {
  $$ConversionHistoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get fromUnit =>
      $composableBuilder(column: $table.fromUnit, builder: (column) => column);

  GeneratedColumn<String> get toUnit =>
      $composableBuilder(column: $table.toUnit, builder: (column) => column);

  GeneratedColumn<double> get fromValue =>
      $composableBuilder(column: $table.fromValue, builder: (column) => column);

  GeneratedColumn<double> get toValue =>
      $composableBuilder(column: $table.toValue, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$ConversionHistoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConversionHistoriesTable,
          ConversionHistory,
          $$ConversionHistoriesTableFilterComposer,
          $$ConversionHistoriesTableOrderingComposer,
          $$ConversionHistoriesTableAnnotationComposer,
          $$ConversionHistoriesTableCreateCompanionBuilder,
          $$ConversionHistoriesTableUpdateCompanionBuilder,
          (
            ConversionHistory,
            BaseReferences<
              _$AppDatabase,
              $ConversionHistoriesTable,
              ConversionHistory
            >,
          ),
          ConversionHistory,
          PrefetchHooks Function()
        > {
  $$ConversionHistoriesTableTableManager(
    _$AppDatabase db,
    $ConversionHistoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConversionHistoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConversionHistoriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ConversionHistoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> fromUnit = const Value.absent(),
                Value<String> toUnit = const Value.absent(),
                Value<double> fromValue = const Value.absent(),
                Value<double> toValue = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => ConversionHistoriesCompanion(
                id: id,
                category: category,
                fromUnit: fromUnit,
                toUnit: toUnit,
                fromValue: fromValue,
                toValue: toValue,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String category,
                required String fromUnit,
                required String toUnit,
                required double fromValue,
                required double toValue,
                Value<DateTime> timestamp = const Value.absent(),
              }) => ConversionHistoriesCompanion.insert(
                id: id,
                category: category,
                fromUnit: fromUnit,
                toUnit: toUnit,
                fromValue: fromValue,
                toValue: toValue,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ConversionHistoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConversionHistoriesTable,
      ConversionHistory,
      $$ConversionHistoriesTableFilterComposer,
      $$ConversionHistoriesTableOrderingComposer,
      $$ConversionHistoriesTableAnnotationComposer,
      $$ConversionHistoriesTableCreateCompanionBuilder,
      $$ConversionHistoriesTableUpdateCompanionBuilder,
      (
        ConversionHistory,
        BaseReferences<
          _$AppDatabase,
          $ConversionHistoriesTable,
          ConversionHistory
        >,
      ),
      ConversionHistory,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ConversionHistoriesTableTableManager get conversionHistories =>
      $$ConversionHistoriesTableTableManager(_db, _db.conversionHistories);
}
