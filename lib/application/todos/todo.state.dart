import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';

part 'todo.state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default(None()) Option authFailureOption,
    @Default(AsyncData([])) AsyncValue<List<TodoModel>> todo,
    @Default([]) List<TodoModel> filteredTodo,
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool iscompleted,
     @Default(false) bool isDeleted,
    @Default(null) TodoModel? selectedTodo,
  }) = _TodoState;
}
