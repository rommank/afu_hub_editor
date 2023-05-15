import 'package:afu_hub_editor/ui/screens/event_screen/event_screen.dart';
import 'package:afu_hub_editor/ui/screens/home_screen.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/section_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/topic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String home = '/';
  static String topic = '/topic';
  static String event = '/event';
  static String section = '/section';
}

final appRouter = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, __, child) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          );
        },
        routes: [
          AppRoute(
            ScreenPaths.home,
            'home',
            (s) => const HomeScreen(),
          ),
          AppRoute(
            ScreenPaths.topic,
            'topic',
            useFade: true,
            (s) => TopicScreen(goRouterState: s),
          ),
          AppRoute(
            ScreenPaths.event,
            'event',
            useFade: true,
            (s) => EventScreen(goRouterState: s),
          ),
          AppRoute(
            ScreenPaths.section,
            'section',
            useFade: true,
            (s) => SectionScreen(goRouterState: s),
          ),
        ]),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, String name, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.useFade = false, this.isFullscreenDialog = false})
      : super(
          path: path,
          name: name,
          routes: routes,
          pageBuilder: (context, state) {
            final pageContent = Scaffold(
              body: builder(state),
              resizeToAvoidBottomInset: false,
            );
            if (useFade) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: pageContent,
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              );
            }

            return CupertinoPage(child: pageContent, fullscreenDialog: isFullscreenDialog);
          },
        );
  final bool useFade;
  final bool isFullscreenDialog;
}
