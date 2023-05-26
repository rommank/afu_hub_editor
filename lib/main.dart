import 'package:afu_hub_editor/common_services/amplify_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app.dart';
import 'common_services/app_logic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final container = ProviderContainer();
  final amplifyService = container.read(amplifyServiceProvider);
  amplifyService.configureAmplify();
  final appLogic = container.read(appLogicProvider);
  await appLogic.bootstrap();

  FlutterNativeSplash.remove();
  runApp(UncontrolledProviderScope(container: container, child: const HubEditorApp()));
}
