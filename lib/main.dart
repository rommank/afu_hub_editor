import 'package:afu_hub_editor/router.dart';
import 'package:afu_hub_editor/styles/authenticator_string_resolvers.dart';
import 'package:afu_hub_editor/styles/color_schemes.g.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'common_services/amplify_service.dart';
import 'common_services/app_logic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  registerSingletons();
  await appLogic.bootstrap();
  FlutterNativeSplash.remove();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerDelegate: appRouter.routerDelegate,
    //   routeInformationProvider: appRouter.routeInformationProvider,
    //   routeInformationParser: appRouter.routeInformationParser,
    //   theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
    //   darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
    // );
    return Authenticator(
      stringResolver: stringResolver,
      initialStep: AuthenticatorStep.signIn,
      child: MaterialApp.router(
        builder: Authenticator.builder(),
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.routerDelegate,
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      ),
    );
  }
}

registerSingletons() {
  GetIt.I.registerLazySingleton<AmplifyService>(() => AmplifyService());
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
AmplifyService get amplifyService => GetIt.I.get<AmplifyService>();
