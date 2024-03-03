import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_rest_api_sample/core/models/task.dart';
import 'package:riverpod_rest_api_sample/core/repositories/tasks_repositories_provider.dart';
import 'package:riverpod_rest_api_sample/features/models/write_task_state.dart';
import 'package:riverpod_rest_api_sample/features/tasks/providers/tasks_provider.dart';

part 'write_task_notifier_provider.g.dart';

@riverpod
class WriteTaskNotifier extends _$WriteTaskNotifier {
  @override
  WriteTaskState build({Task? task}) {
    return WriteTaskState(
        task: task ??
            Task(
                name: "",
                description: "",
                done: false,
                createdAt: 2024,
                id: ''),
        loading: false);
  }

  void nameChanged(String v) {
    state = state.copyWith(task: state.task.copyWith(name: v));
  }

  void descriptionChanged(String v) {
    state = state.copyWith(task: state.task.copyWith(description: v));
  }

  void doneChanged(bool v) {
    state = state.copyWith(task: state.task.copyWith(done: v));
  }

  TasksRepository get _repository => ref.read(tasksRepositoryProvider);

  Future<void> write() async {
    state = state.copyWith(loading: true);
    try {
      if (state.task.id.isEmpty) {
        await _repository.create(state.task);
      } else {
        await _repository.edit(state.task);
      }
      await ref.refresh(tasksProvider);
    } catch (e) {
      state = state.copyWith(loading: false);
      return Future.error(e);
    }
  }
}
