// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isUrgentMeta =
      const VerificationMeta('isUrgent');
  @override
  late final GeneratedColumn<bool> isUrgent = GeneratedColumn<bool>(
      'is_urgent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_urgent" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [id, title, description, isUrgent];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('is_urgent')) {
      context.handle(_isUrgentMeta,
          isUrgent.isAcceptableOrUnknown(data['is_urgent']!, _isUrgentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      isUrgent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_urgent'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String title;
  final String description;
  final bool isUrgent;
  const Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.isUrgent});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['is_urgent'] = Variable<bool>(isUrgent);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
      isUrgent: Value(isUrgent),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      isUrgent: serializer.fromJson<bool>(json['isUrgent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'isUrgent': serializer.toJson<bool>(isUrgent),
    };
  }

  Product copyWith(
          {int? id, String? title, String? description, bool? isUrgent}) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isUrgent: isUrgent ?? this.isUrgent,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isUrgent: $isUrgent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description, isUrgent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.isUrgent == this.isUrgent);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  final Value<bool> isUrgent;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.isUrgent = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
    this.isUrgent = const Value.absent(),
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<bool>? isUrgent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (isUrgent != null) 'is_urgent': isUrgent,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? description,
      Value<bool>? isUrgent}) {
    return ProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isUrgent: isUrgent ?? this.isUrgent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isUrgent.present) {
      map['is_urgent'] = Variable<bool>(isUrgent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('isUrgent: $isUrgent')
          ..write(')'))
        .toString();
  }
}

class $DetailsTable extends Details with TableInfo<$DetailsTable, Detail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (id)'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, productId, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'details';
  @override
  VerificationContext validateIntegrity(Insertable<Detail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Detail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Detail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $DetailsTable createAlias(String alias) {
    return $DetailsTable(attachedDatabase, alias);
  }
}

class Detail extends DataClass implements Insertable<Detail> {
  final int id;
  final String name;

  ///ProductId is same id that we have is products table.
  final int productId;
  final int price;
  const Detail(
      {required this.id,
      required this.name,
      required this.productId,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['product_id'] = Variable<int>(productId);
    map['price'] = Variable<int>(price);
    return map;
  }

  DetailsCompanion toCompanion(bool nullToAbsent) {
    return DetailsCompanion(
      id: Value(id),
      name: Value(name),
      productId: Value(productId),
      price: Value(price),
    );
  }

  factory Detail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Detail(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      productId: serializer.fromJson<int>(json['productId']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'productId': serializer.toJson<int>(productId),
      'price': serializer.toJson<int>(price),
    };
  }

  Detail copyWith({int? id, String? name, int? productId, int? price}) =>
      Detail(
        id: id ?? this.id,
        name: name ?? this.name,
        productId: productId ?? this.productId,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('Detail(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('productId: $productId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, productId, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Detail &&
          other.id == this.id &&
          other.name == this.name &&
          other.productId == this.productId &&
          other.price == this.price);
}

class DetailsCompanion extends UpdateCompanion<Detail> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> productId;
  final Value<int> price;
  const DetailsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.productId = const Value.absent(),
    this.price = const Value.absent(),
  });
  DetailsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int productId,
    required int price,
  })  : name = Value(name),
        productId = Value(productId),
        price = Value(price);
  static Insertable<Detail> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? productId,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (productId != null) 'product_id': productId,
      if (price != null) 'price': price,
    });
  }

  DetailsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? productId,
      Value<int>? price}) {
    return DetailsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      productId: productId ?? this.productId,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DetailsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('productId: $productId, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class ProductViewData extends DataClass {
  final String title;
  final String name;
  const ProductViewData({required this.title, required this.name});
  factory ProductViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductViewData(
      title: serializer.fromJson<String>(json['title']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'name': serializer.toJson<String>(name),
    };
  }

  ProductViewData copyWith({String? title, String? name}) => ProductViewData(
        title: title ?? this.title,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('ProductViewData(')
          ..write('title: $title, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(title, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductViewData &&
          other.title == this.title &&
          other.name == this.name);
}

class $ProductViewView extends ViewInfo<$ProductViewView, ProductViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDataBase attachedDatabase;
  $ProductViewView(this.attachedDatabase, [this._alias]);
  $ProductsTable get products => attachedDatabase.products.createAlias('t0');
  $DetailsTable get details => attachedDatabase.details.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [title, name];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'product_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ProductViewView get asDslTable => this;
  @override
  ProductViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductViewData(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      generatedAs: GeneratedAs(products.title, false),
      type: DriftSqlType.string);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      generatedAs: GeneratedAs(details.name, false), type: DriftSqlType.string);
  @override
  $ProductViewView createAlias(String alias) {
    return $ProductViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(products)..addColumns($columns))
          .join([innerJoin(details, details.productId.equalsExp(products.id))]);
  @override
  Set<String> get readTables => const {'products', 'details'};
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  _$AppDataBaseManager get managers => _$AppDataBaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $DetailsTable details = $DetailsTable(this);
  late final $ProductViewView productView = $ProductViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, details, productView];
}

typedef $$ProductsTableInsertCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  required String title,
  required String description,
  Value<bool> isUrgent,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> description,
  Value<bool> isUrgent,
});

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDataBase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableProcessedTableManager,
    $$ProductsTableInsertCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder> {
  $$ProductsTableTableManager(_$AppDataBase db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ProductsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<bool> isUrgent = const Value.absent(),
          }) =>
              ProductsCompanion(
            id: id,
            title: title,
            description: description,
            isUrgent: isUrgent,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String description,
            Value<bool> isUrgent = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            id: id,
            title: title,
            description: description,
            isUrgent: isUrgent,
          ),
        ));
}

class $$ProductsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDataBase,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableProcessedTableManager,
    $$ProductsTableInsertCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder> {
  $$ProductsTableProcessedTableManager(super.$state);
}

class $$ProductsTableFilterComposer
    extends FilterComposer<_$AppDataBase, $ProductsTable> {
  $$ProductsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get isUrgent => $state.composableBuilder(
      column: $state.table.isUrgent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter detailsRefs(
      ComposableFilter Function($$DetailsTableFilterComposer f) f) {
    final $$DetailsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.details,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder, parentComposers) => $$DetailsTableFilterComposer(
            ComposerState(
                $state.db, $state.db.details, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends OrderingComposer<_$AppDataBase, $ProductsTable> {
  $$ProductsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get isUrgent => $state.composableBuilder(
      column: $state.table.isUrgent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$DetailsTableInsertCompanionBuilder = DetailsCompanion Function({
  Value<int> id,
  required String name,
  required int productId,
  required int price,
});
typedef $$DetailsTableUpdateCompanionBuilder = DetailsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> productId,
  Value<int> price,
});

class $$DetailsTableTableManager extends RootTableManager<
    _$AppDataBase,
    $DetailsTable,
    Detail,
    $$DetailsTableFilterComposer,
    $$DetailsTableOrderingComposer,
    $$DetailsTableProcessedTableManager,
    $$DetailsTableInsertCompanionBuilder,
    $$DetailsTableUpdateCompanionBuilder> {
  $$DetailsTableTableManager(_$AppDataBase db, $DetailsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DetailsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$DetailsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$DetailsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int> price = const Value.absent(),
          }) =>
              DetailsCompanion(
            id: id,
            name: name,
            productId: productId,
            price: price,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int productId,
            required int price,
          }) =>
              DetailsCompanion.insert(
            id: id,
            name: name,
            productId: productId,
            price: price,
          ),
        ));
}

class $$DetailsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDataBase,
    $DetailsTable,
    Detail,
    $$DetailsTableFilterComposer,
    $$DetailsTableOrderingComposer,
    $$DetailsTableProcessedTableManager,
    $$DetailsTableInsertCompanionBuilder,
    $$DetailsTableUpdateCompanionBuilder> {
  $$DetailsTableProcessedTableManager(super.$state);
}

class $$DetailsTableFilterComposer
    extends FilterComposer<_$AppDataBase, $DetailsTable> {
  $$DetailsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$DetailsTableOrderingComposer
    extends OrderingComposer<_$AppDataBase, $DetailsTable> {
  $$DetailsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get price => $state.composableBuilder(
      column: $state.table.price,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDataBaseManager {
  final _$AppDataBase _db;
  _$AppDataBaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$DetailsTableTableManager get details =>
      $$DetailsTableTableManager(_db, _db.details);
}
