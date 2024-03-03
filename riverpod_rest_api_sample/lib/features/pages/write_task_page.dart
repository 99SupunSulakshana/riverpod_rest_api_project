import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_rest_api_sample/core/models/task.dart';
import 'package:riverpod_rest_api_sample/features/tasks/providers/write_task_notifier_provider.dart';

class WriteTaskPage extends ConsumerWidget {
  WriteTaskPage({super.key, this.initial});
  final _formKey = GlobalKey<FormState>();
  final Task? initial;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = writeTaskNotifierProvider(task: initial);
    final state = ref.read(provider);
    final notifier = ref.watch(provider.notifier);
    ref.watch(provider.select((value) => value.loading));
    ref.watch(provider.select((value) => value.task.done));
    ref.watch(provider
        .select((value) => value.task.done.hashCode ^ value.loading.hashCode));
    return Scaffold(
      appBar: AppBar(title: const Text("Write Task")),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FilledButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  await notifier.write();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: empty_catches
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('$e')));
                }
              }
            },
            child: Text("Save")),
      )),
      body: LoadingLayer(
        loading: state.loading,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Name"),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  initialValue: state.task.name,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  onChanged: notifier.nameChanged,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text("Description"),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  initialValue: state.task.description,
                  maxLines: 5,
                  minLines: 3,
                  textCapitalization: TextCapitalization.sentences,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    }
                    return null;
                  },
                  onChanged: notifier.descriptionChanged,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: state.task.done,
                        onChanged: (v) {
                          notifier.doneChanged(v ?? false);
                        }),
                    const Text("Done")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingLayer extends StatelessWidget {
  const LoadingLayer({super.key, required this.loading, required this.child});

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (loading)
          Material(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
      ],
    );
  }
}
