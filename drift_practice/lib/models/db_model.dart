import 'package:equatable/equatable.dart';

class TaskModels extends Equatable {
  final int id;
  final String title;
  final String type;
  final List<AttendantModels> attendant;

  const TaskModels({
    required this.id,
    required this.title,
    required this.type,
    required this.attendant,
  });

  TaskModels copyWith({
    int? id,
    String? title,
    String? type,
    List<AttendantModels>? attendant,
  }) {
    return TaskModels(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
      attendant: attendant ?? this.attendant,
    );
  }

  @override
  List<Object> get props => [id, title, type, attendant];
}

class AttendantModels extends Equatable {
  final int id;
  final String name;

  const AttendantModels({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => name;
}

class TypeModels extends Equatable {
  final int id;
  final String typeName;

  const TypeModels({
    required this.id,
    required this.typeName,
  });

  @override
  List<Object> get props => [id, typeName];
}
