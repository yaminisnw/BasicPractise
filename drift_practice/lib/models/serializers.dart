library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:drift_practice/models/details_model.dart';
import 'package:drift_practice/models/product_model.dart';

import 'app_state.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[AppState, DetailsModel, ProductModel])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
