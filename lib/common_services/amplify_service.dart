import 'dart:async';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../amplifyconfiguration.dart';
import '../../models/ModelProvider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
part 'amplify_service.g.dart';

@riverpod
AmplifyService amplifyService(AmplifyServiceRef ref) {
  return AmplifyService();
}

class AmplifyService {
  Future<void> configureAmplify() async {
    final authPlugin = AmplifyAuthCognito();
    final storage = AmplifyStorageS3();
    final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
    if (!kIsWeb) {
      final datastorePlugin = AmplifyDataStore(
        authModeStrategy: AuthModeStrategy.multiAuth,
        modelProvider: ModelProvider.instance,
        errorHandler: (error) => {
          debugPrint('Error of DataStore $error'),
        },
      );
      await Amplify.addPlugin(datastorePlugin);
    }

    await Amplify.addPlugins([
      apiPlugin,
      storage,
      authPlugin,
    ]);

    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint('Tried to reconfigure Amplify; this can occur when your app restarts on Android.');
    }
  }
}
