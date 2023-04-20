// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$topicsRepositoryHash() => r'98156a7ccfcac5ccd02feab24b12901137824483';

/// See also [topicsRepository].
@ProviderFor(topicsRepository)
final topicsRepositoryProvider = AutoDisposeProvider<TopicsRepository>.internal(
  topicsRepository,
  name: r'topicsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topicsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TopicsRepositoryRef = AutoDisposeProviderRef<TopicsRepository>;
String _$topicsStreamHash() => r'4d284ceaf282b9cdf376fb12d21bf89d024b2b1e';

/// See also [topicsStream].
@ProviderFor(topicsStream)
final topicsStreamProvider =
    AutoDisposeStreamProvider<List<TopicData?>>.internal(
  topicsStream,
  name: r'topicsStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$topicsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TopicsStreamRef = AutoDisposeStreamProviderRef<List<TopicData?>>;
String _$sectionsStreamHash() => r'97189cb04c53e46dc2e23c0054b3308648bd7feb';

/// See also [sectionsStream].
@ProviderFor(sectionsStream)
final sectionsStreamProvider = AutoDisposeStreamProvider<dynamic>.internal(
  sectionsStream,
  name: r'sectionsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sectionsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SectionsStreamRef = AutoDisposeStreamProviderRef<dynamic>;
String _$singleTopicHash() => r'84252a7f39dad962144da990723b3de8b2da3bcf';

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

typedef SingleTopicRef = AutoDisposeStreamProviderRef<TopicData>;

/// See also [singleTopic].
@ProviderFor(singleTopic)
const singleTopicProvider = SingleTopicFamily();

/// See also [singleTopic].
class SingleTopicFamily extends Family<AsyncValue<TopicData>> {
  /// See also [singleTopic].
  const SingleTopicFamily();

  /// See also [singleTopic].
  SingleTopicProvider call({
    required String id,
  }) {
    return SingleTopicProvider(
      id: id,
    );
  }

  @override
  SingleTopicProvider getProviderOverride(
    covariant SingleTopicProvider provider,
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
  String? get name => r'singleTopicProvider';
}

/// See also [singleTopic].
class SingleTopicProvider extends AutoDisposeStreamProvider<TopicData> {
  /// See also [singleTopic].
  SingleTopicProvider({
    required this.id,
  }) : super.internal(
          (ref) => singleTopic(
            ref,
            id: id,
          ),
          from: singleTopicProvider,
          name: r'singleTopicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleTopicHash,
          dependencies: SingleTopicFamily._dependencies,
          allTransitiveDependencies:
              SingleTopicFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is SingleTopicProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
