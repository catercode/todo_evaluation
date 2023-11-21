import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/application/auth/auth.notifier.dart';
import 'package:my_todo_app/application/todos/todo.notifier.dart';
import 'package:my_todo_app/presentation/routes/material.auto.route.gr.dart';

@RoutePage()
class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoComponentState();
}

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _AddTodoComponentState extends ConsumerState<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const TodoHomeRoute());
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.home),
      ),
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            "Add Todo",
            style: TextStyle(fontSize: 16),
          )),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(children: [
            const SizedBox(
              height: 32,
            ),
            const Text(
              "What do we have for today?",
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field requires";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Description"),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field requires";
                }
                return null;
              },
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
                    if (formKey.currentState!.validate()) {
                      await ref
                          .read(todoProvider.notifier)
                          .addTask(
                              title: titleController.text.trim(),
                              description: descriptionController.text.trim())
                          .then((isSuccess) {
                        if (isSuccess) {
                          context.router.push(const SuccessRoute());
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              titleController.clear();
                              descriptionController.clear();
                              context.router.pop();
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Failed to add todo")));
                        }
                      });
                    }
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
                        'Add Task',
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
      ),
    );
  }
}
