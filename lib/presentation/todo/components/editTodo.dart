import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/application/auth/auth.notifier.dart';
import 'package:my_todo_app/application/todos/todo.notifier.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';
import 'package:my_todo_app/presentation/routes/material.auto.route.gr.dart';

@RoutePage()
class EditTodoScreen extends ConsumerStatefulWidget {
  const EditTodoScreen({required this.todo, super.key});
  final TodoModel todo;
  @override
  ConsumerState<EditTodoScreen> createState() => _AddTodoComponentState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

class _AddTodoComponentState extends ConsumerState<EditTodoScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.text = widget.todo.title;
      descriptionController.text = widget.todo.description;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Update todo Title?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: const InputDecoration(hintText: "Description"),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 225, 204, 143)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  await ref
                      .read(todoProvider.notifier)
                      .updateTodoTitle(
                          title: titleController.text.trim(),
                          id: widget.todo.id)
                      .then((isSuccess) {
                    if (isSuccess) {
                      context.router.pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Failed to update todo")));
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ref.watch(todoProvider).isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ))
                        : const SizedBox(),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Update Task',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
