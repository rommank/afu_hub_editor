import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:path/path.dart' as p;
import 'dart:io' as io;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_service.g.dart';

@riverpod
StorageService storageService(StorageServiceRef ref) {
  return StorageService();
}

@riverpod
Future<String> imageUrl(ImageUrlRef ref, {required String key}) {
  return ref
      .watch(storageServiceProvider)
      .getDownloadUrl(key: key, accessLevel: StorageAccessLevel.guest);
}

class StorageService {
  ValueNotifier<double> uploadProgress = ValueNotifier<double>(0);

  ValueNotifier<double> getUploadProgress() {
    return uploadProgress;
  }

  void resetUploadProgress() {
    uploadProgress.value = 0;
  }

  Future<String> getDownloadUrl({
    required String key,
    required StorageAccessLevel accessLevel,
  }) async {
    try {
      final result = await Amplify.Storage.getUrl(
        key: key,
        options: StorageGetUrlOptions(
          accessLevel: accessLevel,
          pluginOptions: S3GetUrlPluginOptions(
            validateObjectExistence: true,
            expiresIn: 1.days,
          ),
        ),
      ).result;
      return result.url.toString();
    } on StorageException catch (e) {
      safePrint(e.message);
      rethrow;
    }
  }

  Future<String?> uploadFile(io.File file) async {
    final extension = p.extension(file.path);
    final key = UUID.getUUID() + extension;
    final awsFile = AWSFile.fromStream(file.openRead(), size: await file.length());
    try {
      await Amplify.Storage.uploadFile(
          localFile: awsFile,
          key: key,
          onProgress: (progress) {
            uploadProgress.value = progress.fractionCompleted;
            print('Completed: ${uploadProgress.value}');
          }).result;

      return key;
    } on StorageException catch (error) {
      safePrint(error.message);
      return null;
    }
  }
}
