import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';

class TodoService {
  Future<bool> addTask(
      {required String title, required String description}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('tasks').add({
        'title': title,
        'description': description,
        'completed': false, // You can add more fields as needed
      });

      return true;
    } catch (e) {
      print('Error adding task: $e');

      return false;
    }
  }

  Future<bool> updateTaskStatus(
      {required String taskId, required bool isCompleted}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('tasks').doc(taskId).update({
      'completed': isCompleted,
    });
    return true;
  }

  Future<bool> deleteTask({required String taskId}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('tasks').doc(taskId).delete();
    return true;
  }

  Future<List<TodoModel>> fetchTodos() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final QuerySnapshot querySnapshot =
          await firestore.collection('tasks').get();
      List<TodoModel> todos = [];

      for (var task in querySnapshot.docs) {
        final taskData = task.data() as Map<String, dynamic>;
        final todo = TodoModel(
          id: task.id,
          title: taskData['title'],
          description: taskData['description'],
          completed: taskData['completed'],
        );
        todos.add(todo);
      }

      return todos;
    } catch (e) {
      print('Error fetching todos: $e');
      return [];
    }
  }

  Future<bool> updateTaskTitle(
      {required String taskId, required String newTitle}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('tasks').doc(taskId).update({
        'title': newTitle,
      });
      return true;
    } catch (e) {
      print('Error updating task title: $e');
      return false;
    }
  }
}
