import 'package:drift/drift.dart';
import 'package:drift_practice/data/db/product.dart';

import '../../models/product_model.dart';
import 'details.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Products, Details], views: [ProductView])
class AppDataBase extends _$AppDataBase {
  AppDataBase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onCreate: (m) async {
      m.createAll();
    }, onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.addColumn(products, products.isUrgent);
      }
      if (from < 3) {
        await m.addColumn(details, details.price);
      }
    });
  }
}

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//
//     // Also work around limitations on old Android versions
//     if (Platform.isAndroid) {
//       await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
//     }
//
//     // Make sqlite3 pick a more suitable location for temporary files - the
//     // one from the system may be inaccessible due to sandboxing.
//     final cachebase = (await getTemporaryDirectory()).path;
//     // We can't access /tmp on Android, which sqlite3 would try by default.
//     // Explicitly tell it about the correct temporary directory.
//     sqlite3.tempDirectory = cachebase;
//
//     return NativeDatabase.createInBackground(file);
//   });
// }
