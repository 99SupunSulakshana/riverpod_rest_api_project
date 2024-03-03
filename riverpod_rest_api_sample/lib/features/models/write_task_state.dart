import 'package:riverpod_rest_api_sample/core/models/task.dart';

class WriteTaskState {
  final Task task;
  final bool loading;

  WriteTaskState({required this.task, required this.loading});

  WriteTaskState copyWith({
    Task? task,
    bool? loading,
  }) {
    return WriteTaskState(
        task: task ?? this.task, loading: loading ?? this.loading);
  }
}
