// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventsRepositoryHash() => r'da8b8f68c6371fcce2302fa1e992b9fb3f027ea8';

/// See also [eventsRepository].
@ProviderFor(eventsRepository)
final eventsRepositoryProvider = AutoDisposeProvider<EventsRepository>.internal(
  eventsRepository,
  name: r'eventsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$eventsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventsRepositoryRef = AutoDisposeProviderRef<EventsRepository>;
String _$eventsForTopicHash() => r'348dba882cff8b53cdc5789d04366e053fd903bd';

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

typedef EventsForTopicRef = AutoDisposeStreamProviderRef<List<EventData?>>;

/// See also [eventsForTopic].
@ProviderFor(eventsForTopic)
const eventsForTopicProvider = EventsForTopicFamily();

/// See also [eventsForTopic].
class EventsForTopicFamily extends Family<AsyncValue<List<EventData?>>> {
  /// See also [eventsForTopic].
  const EventsForTopicFamily();

  /// See also [eventsForTopic].
  EventsForTopicProvider call({
    required String id,
  }) {
    return EventsForTopicProvider(
      id: id,
    );
  }

  @override
  EventsForTopicProvider getProviderOverride(
    covariant EventsForTopicProvider provider,
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
  String? get name => r'eventsForTopicProvider';
}

/// See also [eventsForTopic].
class EventsForTopicProvider
    extends AutoDisposeStreamProvider<List<EventData?>> {
  /// See also [eventsForTopic].
  EventsForTopicProvider({
    required this.id,
  }) : super.internal(
          (ref) => eventsForTopic(
            ref,
            id: id,
          ),
          from: eventsForTopicProvider,
          name: r'eventsForTopicProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$eventsForTopicHash,
          dependencies: EventsForTopicFamily._dependencies,
          allTransitiveDependencies:
              EventsForTopicFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is EventsForTopicProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$eventsHash() => r'2afb7197103c1490c8d5db8e073519284d534d87';

/// See also [events].
@ProviderFor(events)
final eventsProvider = AutoDisposeStreamProvider<List<EventData?>>.internal(
  events,
  name: r'eventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$eventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventsRef = AutoDisposeStreamProviderRef<List<EventData?>>;
String _$singleEventHash() => r'f895a6805ddd076cb0eb014320fbae94c06f0e94';
typedef SingleEventRef = AutoDisposeStreamProviderRef<EventData>;

/// See also [singleEvent].
@ProviderFor(singleEvent)
const singleEventProvider = SingleEventFamily();

/// See also [singleEvent].
class SingleEventFamily extends Family<AsyncValue<EventData>> {
  /// See also [singleEvent].
  const SingleEventFamily();

  /// See also [singleEvent].
  SingleEventProvider call({
    required String id,
  }) {
    return SingleEventProvider(
      id: id,
    );
  }

  @override
  SingleEventProvider getProviderOverride(
    covariant SingleEventProvider provider,
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
  String? get name => r'singleEventProvider';
}

/// See also [singleEvent].
class SingleEventProvider extends AutoDisposeStreamProvider<EventData> {
  /// See also [singleEvent].
  SingleEventProvider({
    required this.id,
  }) : super.internal(
          (ref) => singleEvent(
            ref,
            id: id,
          ),
          from: singleEventProvider,
          name: r'singleEventProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleEventHash,
          dependencies: SingleEventFamily._dependencies,
          allTransitiveDependencies:
              SingleEventFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is SingleEventProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
