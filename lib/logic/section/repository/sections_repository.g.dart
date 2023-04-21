// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sectionsRepositoryHash() =>
    r'4b020d75e3d08811d7fca6e32ab2ca9f3fc64568';

/// See also [sectionsRepository].
@ProviderFor(sectionsRepository)
final sectionsRepositoryProvider =
    AutoDisposeProvider<SectionsRepository>.internal(
  sectionsRepository,
  name: r'sectionsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sectionsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SectionsRepositoryRef = AutoDisposeProviderRef<SectionsRepository>;
String _$sectionsForTopicHash() => r'6b6a540173e744d85f9f4d42967c62a0704d904c';

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

typedef SectionsForTopicRef = AutoDisposeStreamProviderRef<List<SectionData?>>;

/// See also [sectionsForTopic].
@ProviderFor(sectionsForTopic)
const sectionsForTopicProvider = SectionsForTopicFamily();

/// See also [sectionsForTopic].
class SectionsForTopicFamily extends Family<AsyncValue<List<SectionData?>>> {
  /// See also [sectionsForTopic].
  const SectionsForTopicFamily();

  /// See also [sectionsForTopic].
  SectionsForTopicProvider call({
    required String id,
  }) {
    return SectionsForTopicProvider(
      id: id,
    );
  }

  @override
  SectionsForTopicProvider getProviderOverride(
    covariant SectionsForTopicProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'sectionsForTopicProvider';
}

/// See also [sectionsForTopic].
class SectionsForTopicProvider
    extends AutoDisposeStreamProvider<List<SectionData?>> {
  /// See also [sectionsForTopic].
  SectionsForTopicProvider({
    required this.id,
  }) : super.internal(
          (ref) => sectionsForTopic(
            ref,
            id: id,
          ),
          from: sectionsForTopicProvider,
          name: r'sectionsForTopicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sectionsForTopicHash,
          dependencies: SectionsForTopicFamily._dependencies,
          allTransitiveDependencies:
              SectionsForTopicFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is SectionsForTopicProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$sectionsHash() => r'f3f880b79a3b5eb392067309f51324763179e758';

/// See also [sections].
@ProviderFor(sections)
final sectionsProvider = AutoDisposeStreamProvider<List<SectionData?>>.internal(
  sections,
  name: r'sectionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sectionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SectionsRef = AutoDisposeStreamProviderRef<List<SectionData?>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
