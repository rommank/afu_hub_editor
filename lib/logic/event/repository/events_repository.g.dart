// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$eventsRepositoryHash() => r'6f0329f5cca76ee25670f3644ae7b82619c8a37a';

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
String _$eventsHash() => r'2e9b10e626ef4d0985594a8790e54781c0de8b90';

/// See also [events].
@ProviderFor(events)
final eventsProvider = AutoDisposeStreamProvider<List<EventData>>.internal(
  events,
  name: r'eventsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$eventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EventsRef = AutoDisposeStreamProviderRef<List<EventData>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
