import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drift/drift.dart';
import 'package:drift_practice/models/serializers.dart';

import '../data/db/details.dart';
import '../data/db/product.dart';

part 'product_model.g.dart';

abstract class ProductModel
    implements Built<ProductModel, ProductModelBuilder> {
  ProductModel._();
  factory ProductModel([void Function(ProductModelBuilder) updates]) =
      _$ProductModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ProductModel.serializer, this)
        as Map<String, dynamic>;
  }

  static ProductModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ProductModel.serializer, json)!;
  }

  static Serializer<ProductModel> get serializer => _$productModelSerializer;
}

abstract class ProductView extends View {
  Products get products;
  Details get details;

  //Implementing join
  Expression<String> get data =>
      products.title + const Constant('(') + details.name + const Constant(')');

  ///join clause is used to combine rows from two or more tables based on the related columns between them
  @override
  Query as() => select([products.title, details.name])
      .from(products)
      //innerJoin returns the records that have match in both the tables
      .join([innerJoin(details, details.productId.equalsExp(products.id))]);
}

///SELECT column_name(s) FROM table1 INNER JOIN table ON table1.column_name= table2.column_name;
