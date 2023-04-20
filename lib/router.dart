import 'package:afu_hub_editor/ui/screens/home_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/edit_topic_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/new_topic_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static String home = '/';
  static String newTopic = '/new-topic';
  static String topic = '/topic:id';
}

final appRouter = GoRouter(
  routes: [
    AppRoute(
      ScreenPaths.home,
      'home',
      (s) => const HomeScreen(),
    ),
    AppRoute(
      ScreenPaths.newTopic,
      'new-topic',
      useFade: true,
      (s) => NewTopicScreen(),
    ),
    AppRoute(
      ScreenPaths.topic,
      'topic',
      (s) => EditTopicScreen(topicId: s.params['id']!),
    ),
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
