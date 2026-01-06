// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hasOnboardingDone)
final hasOnboardingDoneProvider = HasOnboardingDoneProvider._();

final class HasOnboardingDoneProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  HasOnboardingDoneProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasOnboardingDoneProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasOnboardingDoneHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasOnboardingDone(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasOnboardingDoneHash() => r'8deb0c4f5f31de42a86f7a2f765f1fdfe4961291';
