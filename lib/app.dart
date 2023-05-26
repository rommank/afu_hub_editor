import 'package:afu_hub_editor/router.dart';
import 'package:afu_hub_editor/styles/authenticator_string_resolvers.dart';
import 'package:afu_hub_editor/styles/color_schemes.g.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class HubEditorApp extends StatelessWidget {
  const HubEditorApp({super.key});

  @override
  Widget build(BuildContext context) {
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
