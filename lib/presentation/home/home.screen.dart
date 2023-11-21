import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/application/todos/todo.notifier.dart';
import 'package:my_todo_app/presentation/routes/material.auto.route.gr.dart';
import 'package:my_todo_app/presentation/todo/components/todo.card.dart';

@RoutePage()
class TodoHomeScreen extends ConsumerStatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  ConsumerState<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends ConsumerState<TodoHomeScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(todoProvider.notifier).getAllTodos();
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.replace(const AddTodoRoute());
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
            backgroundColor: Colors.amber, title: const Text("My Todos")),
        body: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (searchvalue) => ref
                      .read(todoProvider.notifier)
                      .filterTask(search: searchvalue),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Filter task"),
                ),
              ),
            ),
            ref.watch(todoProvider).todo.when(
                  data: (todo) {
                    final filteredTodo = ref.watch(todoProvider).filteredTodo;

                    return filteredTodo.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: filteredTodo.length,
                            itemBuilder: (context, index) {
                              return TodoCard(
                                todo: todo[index],
                                index: index,
                                onCheckBoxChanged: (p0) {},
                              );
                            },
                          )
                        : const Center(child: Text("No Task Found"));
                  },
                  error: (error, stackTrace) =>
                      const Text("Something went wrong"),
                  loading: () {
                    return const Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                    );
                  },
                ),
          ],
        ));
  }
}
