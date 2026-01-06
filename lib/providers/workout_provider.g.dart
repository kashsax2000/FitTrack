// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkoutNotifier)
final workoutProvider = WorkoutNotifierProvider._();

final class WorkoutNotifierProvider
    extends $NotifierProvider<WorkoutNotifier, List<Workout>> {
  WorkoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutNotifierHash();

  @$internal
  @override
  WorkoutNotifier create() => WorkoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Workout> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Workout>>(value),
    );
  }
}

String _$workoutNotifierHash() => r'012743a6803ee2545ca72554dc054f00acd4d96f';

abstract class _$WorkoutNotifier extends $Notifier<List<Workout>> {
  List<Workout> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Workout>, List<Workout>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Workout>, List<Workout>>,
              List<Workout>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
