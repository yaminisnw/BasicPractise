import 'package:drift/native.dart';

import 'data/db/app_db.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  final database = AppDataBase(NativeDatabase.memory());

  //Since our database is empty we will add some datas into the database and try to print those datas

  ///Inserting some datas into the table 'products'
  ///With the help of ProductCompanion we are able to insert data into our database.
  final id =
      await database.into(database.products).insert(ProductsCompanion.insert(
            title: 'Drift',
            description: 'Drift Database',
          ));
  // await database.into(database.products).insert(ProductsCompanion.insert(
  //   title: 'Drift tutorial',
  //   description: 'Drift Database2',
  // ));
  await database.into(database.details).insert(DetailsCompanion.insert(
      name: 'Details Database', productId: id, price: 100));

  //This prints the product table
  (await database.select(database.products).get()).forEach(print);

  //This prints the detail table
  (await database.select(database.details).get()).forEach(print);

  // This prints the only the specific value from the specified table
  (await database.select(database.productView).get()).forEach(print);

  //runApp(const MyApp());
}
