import 'dart:async';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';
import '../../amplifyconfiguration.dart';
import '../../models/ModelProvider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AmplifyService {
  Future<void> configureAmplify() async {
    try {
      final authPlugin = AmplifyAuthCognito();
      final storage = AmplifyStorageS3();
      final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
      if (!kIsWeb) {
        final datastorePlugin = AmplifyDataStore(
            authModeStrategy: AuthModeStrategy.multiAuth,
            modelProvider: ModelProvider.instance,
            errorHandler: (error) => {debugPrint('Error of DataStore $error')});
        await Amplify.addPlugin(datastorePlugin);
      }
      await Amplify.addPlugins([
        apiPlugin,
        storage,
        authPlugin,
      ]);
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }
}
