import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_todo_app/application/auth/auth.state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_todo_app/application/todos/todo.state.dart';
import 'package:my_todo_app/infrastructure/auth.services.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';
import 'package:my_todo_app/infrastructure/todo.services.dart';

///Provider for managing the authentication state and functionality.
final todoProvider =
    StateNotifierProvider<TodoNotifier, TodoState>((ref) => TodoNotifier());
final todoService = TodoService();
final selectTodoProvider = StateProvider.autoDispose<int?>((ref) => -1);
final deleteTodoProvider = StateProvider.autoDispose<int?>((ref) => -1);

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier() : super(const TodoState());

  getAllTodos() async {
    state = state.copyWith(todo: const AsyncLoading());
    final todos = await todoService.fetchTodos();
    state = state.copyWith(filteredTodo: todos, todo: AsyncData(todos));
  }

  fetchTodosByStatus({required bool todoStatus}) async {
    state = state.copyWith(todo: const AsyncLoading());
    final todos = await todoService.fetchTodosByStatus(todoStatus: todoStatus);
    state = state.copyWith(filteredTodo: todos, todo: AsyncData(todos));
  }

  Future<bool> addTask(
      {required String title, required String description}) async {
    state = state.copyWith(isLoading: true);

    await todoService
        .addTask(title: title, description: description)
        .then((value) {
      if (value == true) {
        state = state.copyWith(isLoading: false, isSuccess: true);
      } else {
        state = state.copyWith(isLoading: false, isSuccess: false);
      }
    });
    return state.isSuccess;
  }

  clearSuccess() {
    // state = state.copyWith(isSuccess: false);
  }
  Future<bool> updateTodoTitle({
    required TodoModel selectedTodo,
    required String id,
    required String title,
    required String description,
  }) async {
    state = state.copyWith(isLoading: true);
    List<TodoModel> newTodoList = List.from(state.todo.value!.toList());
    state = state.copyWith(isLoading: true);
    for (int i = 0; i < newTodoList.length; i++) {
      if (newTodoList[i].id == selectedTodo.id) {
        final updatedTodo =
            selectedTodo.copyWith(title: title, description: description);
        newTodoList[i] = updatedTodo;
        break;
      }
    }
    await todoService
        .updateTaskTitle(taskId: id, title: title, description: description)
        .then((value) {
      if (value == true) {
        state = state.copyWith(
            todo: AsyncData(newTodoList),
            filteredTodo: newTodoList,
            iscompleted: true,
            isLoading: false,
            isSuccess: true);
      } else {
        state = state.copyWith(
          todo: AsyncData(state.todo.value!),
          filteredTodo: state.todo.value!,
          isLoading: false,
          iscompleted: false,
        );
      }
    });
    return state.isSuccess;
  }

  Future<bool> deleteTodo({required TodoModel todo, int? index}) async {
    state = state.copyWith(isDeleted: true);

    await todoService
        .deleteTask(
      taskId: todo.id,
    )
        .then((value) {
      if (value == true) {
        state.todo.value!.removeAt(index!);

        state = state.copyWith(
            todo: AsyncData(state.todo.value!),
            filteredTodo: state.todo.value!,
            iscompleted: true,
            isDeleted: false,
            isSuccess: true);
      } else {
        state = state.copyWith(
          todo: AsyncData(state.todo.value!),
          filteredTodo: state.todo.value!,
          isDeleted: false,
          iscompleted: false,
        );
      }
    });
    return state.iscompleted;
  }

  Future<bool> completeTodo(
      {required TodoModel selectedTodo,
      required bool complete,
      required int index}) async {
    List<TodoModel> newTodoList = List.from(state.todo.value!.toList());
    state = state.copyWith(isLoading: true);
    for (int i = 0; i < newTodoList.length; i++) {
      if (newTodoList[i].id == selectedTodo.id) {
        final updatedTodo = selectedTodo.copyWith(completed: complete);
        newTodoList[i] = updatedTodo;
        break;
      }
    }
    await todoService
        .updateTaskStatus(taskId: selectedTodo.id, isCompleted: complete)
        .then((value) {
      if (value == true) {
        state = state.copyWith(
            todo: AsyncData(newTodoList),
            filteredTodo: newTodoList,
            iscompleted: true,
            isLoading: false,
            isSuccess: true);
      } else {
        state = state.copyWith(
          todo: AsyncData(newTodoList),
          filteredTodo: newTodoList,
          isLoading: false,
          isSuccess: false,
          iscompleted: false,
        );
      }
    });
    return state.isSuccess;
  }

  filterTask({required String search}) async {
    final todos = state.todo.value!;
    if (search.isEmpty) {
      state = state.copyWith(filteredTodo: todos);
    } else {
      List<TodoModel> filteredTask =
          todos.where((todos) => todos.title.contains(search)).toList();

      state = state.copyWith(filteredTodo: filteredTask);
    }
  }
}
