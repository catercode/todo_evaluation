import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_app/application/todos/todo.notifier.dart';
import 'package:my_todo_app/infrastructure/model/todo.model.dart';
import 'package:my_todo_app/presentation/todo/components/editTodo.dart';

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

final GlobalKey<ScaffoldState> modelScaffoldKey = GlobalKey<ScaffoldState>();

class _TodoCardState extends ConsumerState<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final todoiIndex = ref.watch(selectTodoProvider);

    return InkWell(
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            useRootNavigator: true,
            context: context,
            builder: (_) => Scaffold(
                  extendBody: false,
                  backgroundColor: Colors.white,
                  key: modelScaffoldKey,
                  body:  EditTodoScreen(todo: widget.todo!,),
                ));
      },
      child: Card(
        color: Colors.amber.shade50,
        elevation: 1,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          title: Text(
            widget.todo!.title,
            style: TextStyle(
              fontSize: 16,
              decoration: widget.todo!.completed
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          subtitle: Text(
            widget.todo!.description,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          leading: !ref.watch(todoProvider).isLoading
              ? Checkbox(
                  value: widget.todo!.completed,
                  onChanged: (value) {
                    ref.read(selectTodoProvider.notifier).state = widget.index!;
                    ref.read(todoProvider.notifier).completeTodo(
                        complete: value!, selectedTodo: widget.todo!);
                  },
                )
              : const SizedBox(
                  width: 15, height: 15, child: CircularProgressIndicator()),
          trailing: !ref.watch(todoProvider).isDeleted
              ? InkWell(
                  onTap: () {
                    ref
                        .read(todoProvider.notifier)
                        .deleteTodo(todo: widget.todo!, index: widget.index);
                  },
                  child: const Icon(Icons.delete))
              : const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
        ),
      ),
    );
  }
}
