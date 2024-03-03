// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'write_task_notifier_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$writeTaskNotifierHash() => r'9999c21dc64500f671a16829bf14bd92f48d4307';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WriteTaskNotifier
    extends BuildlessAutoDisposeNotifier<WriteTaskState> {
  late final Task? task;

  WriteTaskState build({
    Task? task,
  });
}

/// See also [WriteTaskNotifier].
@ProviderFor(WriteTaskNotifier)
const writeTaskNotifierProvider = WriteTaskNotifierFamily();

/// See also [WriteTaskNotifier].
class WriteTaskNotifierFamily extends Family<WriteTaskState> {
  /// See also [WriteTaskNotifier].
  const WriteTaskNotifierFamily();

  /// See also [WriteTaskNotifier].
  WriteTaskNotifierProvider call({
    Task? task,
  }) {
    return WriteTaskNotifierProvider(
      task: task,
    );
  }

  @override
  WriteTaskNotifierProvider getProviderOverride(
    covariant WriteTaskNotifierProvider provider,
  ) {
    return call(
      task: provider.task,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'writeTaskNotifierProvider';
}

/// See also [WriteTaskNotifier].
class WriteTaskNotifierProvider
    extends AutoDisposeNotifierProviderImpl<WriteTaskNotifier, WriteTaskState> {
  /// See also [WriteTaskNotifier].
  WriteTaskNotifierProvider({
    Task? task,
  }) : this._internal(
          () => WriteTaskNotifier()..task = task,
          from: writeTaskNotifierProvider,
          name: r'writeTaskNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$writeTaskNotifierHash,
          dependencies: WriteTaskNotifierFamily._dependencies,
          allTransitiveDependencies:
              WriteTaskNotifierFamily._allTransitiveDependencies,
          task: task,
        );

  WriteTaskNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.task,
  }) : super.internal();

  final Task? task;

  @override
  WriteTaskState runNotifierBuild(
    covariant WriteTaskNotifier notifier,
  ) {
    return notifier.build(
      task: task,
    );
  }

  @override
  Override overrideWith(WriteTaskNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: WriteTaskNotifierProvider._internal(
        () => create()..task = task,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        task: task,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<WriteTaskNotifier, WriteTaskState>
      createElement() {
    return _WriteTaskNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WriteTaskNotifierProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WriteTaskNotifierRef on AutoDisposeNotifierProviderRef<WriteTaskState> {
  /// The parameter `task` of this provider.
  Task? get task;
}

class _WriteTaskNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<WriteTaskNotifier,
        WriteTaskState> with WriteTaskNotifierRef {
  _WriteTaskNotifierProviderElement(super.provider);

  @override
  Task? get task => (origin as WriteTaskNotifierProvider).task;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
