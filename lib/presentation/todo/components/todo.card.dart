import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_todo_app/application/todos/todo.notifier.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';
import 'package:my_todo_app/presentation/routes/material.auto.route.gr.dart';
import 'package:my_todo_app/presentation/todo/editTodo.Screen.dart';

class TodoCard extends ConsumerStatefulWidget {
  int? index;
  String? id;
  TodoModel? todo;
  Function(bool) onCheckBoxChanged;

  TodoCard(
      {super.key,
      this.id,
      this.index,
      required this.onCheckBoxChanged,
      this.todo});

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends ConsumerState<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final todoiIndex = ref.watch(selectTodoProvider);
    final deleteTodoIndex = ref.watch(deleteTodoProvider);

    return InkWell(
      onTap: () {
        context.router.push(
          EditTodoRoute(
            todo: widget.todo!,
          ),
        );
      },
      child: Card(
          color: Colors.amber.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                todoiIndex != widget.index
                    ? Checkbox(
                        value: widget.todo!.completed,
                        onChanged: (value) {
                          ref.read(selectTodoProvider.notifier).state =
                              widget.index;
                          ref
                              .read(todoProvider.notifier)
                              .completeTodo(
                                  complete: value!,
                                  selectedTodo: widget.todo!,
                                  index: widget.index!)
                              .then((value) {
                            ref.read(selectTodoProvider.notifier).state = -1;
                          });
                        },
                      )
                    : const SpinKitDualRing(
                        color: Colors.black,
                        size: 15,
                      ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.todo!.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: widget.todo!.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        widget.todo!.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                deleteTodoIndex == widget.index
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ))
                    : IconButton(
                        onPressed: () {
                          ref.read(deleteTodoProvider.notifier).state =
                              widget.index;
                          ref
                              .read(todoProvider.notifier)
                              .deleteTodo(
                                  todo: widget.todo!, index: widget.index)
                              .then((value) {
                            if (value == true) {
                              ref.read(deleteTodoProvider.notifier).state = -1;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Fail to delete todo")));
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                        )),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )),
    );
  }
}
