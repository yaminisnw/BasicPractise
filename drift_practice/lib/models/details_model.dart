import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:drift/drift.dart';
import 'package:drift_practice/models/serializers.dart';

import '../data/db/details.dart';

part 'details_model.g.dart';

abstract class DetailsModel
    implements Built<DetailsModel, DetailsModelBuilder> {
  DetailsModel._();

  factory DetailsModel([void Function(DetailsModelBuilder) updates]) =
      _$DetailsModel;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DetailsModel.serializer, this)
        as Map<String, dynamic>;
  }

  static DetailsModel fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DetailsModel.serializer, json)!;
  }

  static Serializer<DetailsModel> get serializer => _$detailsModelSerializer;
}
