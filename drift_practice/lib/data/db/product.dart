import 'package:drift/drift.dart';

class Products extends Table {
  //V1 columns
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();

  //Adding new Columns for version2
  BoolColumn get isUrgent => boolean().withDefault(const Constant(false))();
}
