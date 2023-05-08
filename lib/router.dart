import 'package:afu_hub_editor/ui/screens/event_screen/edit_event_screen.dart';
import 'package:afu_hub_editor/ui/screens/event_screen/new_event_screen.dart';
import 'package:afu_hub_editor/ui/screens/home_screen.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/edit_section_screen.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/new_section_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/edit_topic_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/new_topic_screen.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ScreenPaths {
  static String home = '/';
  static String newTopic = '/new-topic';
  static String topic = '/topic:id';
  static String event = '/event:id';
  static String section = '/section';
  static String newEvent = '/new-event';
  static String newSection = '/new-section';
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
            ScreenPaths.newTopic,
            'new-topic',
            useFade: true,
            (s) => NewTopicScreen(),
          ),
          AppRoute(
            ScreenPaths.topic,
            'topic',
            useFade: true,
            (s) => EditTopicScreen(topicId: s.params['id']!),
          ),
          AppRoute(
            ScreenPaths.newEvent,
            'new-event',
            useFade: true,
            (s) => NewEventScreen(),
          ),
          AppRoute(
            ScreenPaths.event,
            'event',
            useFade: true,
            (s) => EditEventScreen(eventId: s.params['id']!),
          ),
          AppRoute(
            ScreenPaths.newSection,
            'new-section',
            useFade: true,
            (s) => NewSectionScreen(),
          ),
          AppRoute(
            ScreenPaths.section,
            'section',
            useFade: true,
            (s) => EditSectionScreen(goRouterState: s),
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
