
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.model.freezed.dart';
part 'todo.model.g.dart';

@freezed
class TodoModel with _$TodoModel {
  factory TodoModel({
    required String id,
    required String title,
    required String description,
    required bool completed,
  
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}