import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_todo_app/application/auth/auth.notifier.dart';
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
      ref.read(todoProvider.notifier).fetchTodosByStatus(todoStatus: false);
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (previous, next) {
      if (next.islogingOut == true) {
        context.router.replaceAll([LoginRoute()]);

        ref.read(authProvider.notifier).clearSuccess();
      }
    });
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.replace(const AddTodoRoute());
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("My Todos"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () {
                    ref.read(authProvider.notifier).logout();
                  },
                  child: ref.watch(authProvider).isLoading
                      ? const SpinKitDualRing(
                          color: Colors.black,
                          size: 15,
                        )
                      : const Text(
                          "Log Out",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green.shade200)),
                      onPressed: () {
                        ref
                            .read(todoProvider.notifier)
                            .fetchTodosByStatus(todoStatus: true);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Completed Task"),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black),
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.amber.shade200)),
                      onPressed: () {
                        ref
                            .read(todoProvider.notifier)
                            .fetchTodosByStatus(todoStatus: false);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Uncompleted Task"),
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ref.watch(todoProvider).todo.when(
                    data: (todo) {
                      final filteredTodo = ref.watch(todoProvider).filteredTodo;

                      return filteredTodo.isNotEmpty
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: filteredTodo.length,
                                itemBuilder: (context, index) {
                                  return TodoCard(
                                    todo: todo[index],
                                    index: index,
                                    onCheckBoxChanged: (p0) {},
                                  );
                                },
                              ),
                            )
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Image.asset(
                                  "assets/images/eto-do-list.png",
                                  width: 100,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Center(child: Text("No Task Found")),
                              ],
                            );
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
          ),
        ));
  }
}
