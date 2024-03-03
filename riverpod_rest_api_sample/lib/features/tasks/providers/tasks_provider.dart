import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_rest_api_sample/core/models/task.dart';
import 'package:riverpod_rest_api_sample/core/repositories/tasks_repositories_provider.dart';

part 'tasks_provider.g.dart';

@riverpod
FutureOr<List<Task>> tasks(TasksRef ref) {
  return ref.read(tasksRepositoryProvider).list();
}
