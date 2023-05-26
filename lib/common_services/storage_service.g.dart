// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storageServiceHash() => r'b9eb09cfea0c265efa80435bdffda55cb5e6d8ba';

/// See also [storageService].
@ProviderFor(storageService)
final storageServiceProvider = AutoDisposeProvider<StorageService>.internal(
  storageService,
  name: r'storageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$storageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StorageServiceRef = AutoDisposeProviderRef<StorageService>;
String _$imageUrlHash() => r'ea7595e0f4ae195d2582ccf52d88c3dad5a3df06';

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

typedef ImageUrlRef = AutoDisposeFutureProviderRef<String>;

/// See also [imageUrl].
@ProviderFor(imageUrl)
const imageUrlProvider = ImageUrlFamily();

/// See also [imageUrl].
class ImageUrlFamily extends Family<AsyncValue<String>> {
  /// See also [imageUrl].
  const ImageUrlFamily();

  /// See also [imageUrl].
  ImageUrlProvider call({
    required String key,
  }) {
    return ImageUrlProvider(
      key: key,
    );
  }

  @override
  ImageUrlProvider getProviderOverride(
    covariant ImageUrlProvider provider,
  ) {
    return call(
      key: provider.key,
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
  String? get name => r'imageUrlProvider';
}

/// See also [imageUrl].
class ImageUrlProvider extends AutoDisposeFutureProvider<String> {
  /// See also [imageUrl].
  ImageUrlProvider({
    required this.key,
  }) : super.internal(
          (ref) => imageUrl(
            ref,
            key: key,
          ),
          from: imageUrlProvider,
          name: r'imageUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$imageUrlHash,
          dependencies: ImageUrlFamily._dependencies,
          allTransitiveDependencies: ImageUrlFamily._allTransitiveDependencies,
        );

  final String key;

  @override
  bool operator ==(Object other) {
    return other is ImageUrlProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
