import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_rest_api_sample/core/models/task.dart';
import 'package:riverpod_rest_api_sample/core/repositories/tasks_repositories_provider.dart';
import 'package:riverpod_rest_api_sample/features/pages/write_task_page.dart';
import 'package:riverpod_rest_api_sample/features/tasks/providers/tasks_provider.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = Theme.of(context).colorScheme;
    void goToWrite(Task? task) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WriteTaskPage(
                    initial: task,
                  )));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        backgroundColor: Colors.amber,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WriteTaskPage()));
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // ignore: unused_result
          ref.refresh(tasksProvider);
        },
        child: ref.watch(tasksProvider).when(
            data: (data) => ListView(
                  children: data
                      .map((e) => Dismissible(
                            key: ValueKey(e.id),
                            background: Container(
                              color: scheme.errorContainer,
                              child: Row(children: [
                                AspectRatio(
                                    aspectRatio: 1,
                                    child: Center(
                                        child: Icon(Icons.delete_rounded,
                                            color: scheme.onErrorContainer)))
                              ]),
                            ),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) async {
                              await ref
                                  .read(tasksRepositoryProvider)
                                  .delete(e.id);
                              ref.read(tasksProvider).value!.remove(e);
                              ref.refresh(tasksProvider);
                            },
                            confirmDismiss: (direction) async {
                              return showAdaptiveDialog(
                                  context: context,
                                  builder: (context) => AlertDialog.adaptive(
                                        title: const Text("Delete Task?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel")),
                                          TextButton(
                                              style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      scheme.error),
                                              onPressed: () {
                                                Navigator.pop(context, true);
                                              },
                                              child: const Text("Delete")),
                                        ],
                                      ));
                            },
                            child: ListTile(
                              onTap: () {
                                goToWrite(e);
                              },
                              leading: Checkbox(
                                value: e.done,
                                onChanged: (value) async {
                                  try {
                                    await ref
                                        .read(tasksRepositoryProvider)
                                        .edit(e.copyWith(done: value));
                                    ref.refresh(tasksProvider);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                              ),
                              title: Text(e.name),
                              subtitle: Text(e.description),
                            ),
                          ))
                      .toList(),
                ),
            error: (error, stackTrace) => Center(
                  child: Text("$error"),
                ),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )),
      ),
    );
  }
}
