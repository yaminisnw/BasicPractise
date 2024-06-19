import 'package:drift/drift.dart';
import 'package:drift_practice/data/db/product.dart';

class Details extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();

  ///ProductId is same id that we have is products table.
  IntColumn get productId => integer().references(Products, #id)();

  //Adding new column for version 3
  IntColumn get price => integer()();
}
