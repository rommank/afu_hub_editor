import 'package:afu_hub_editor/ui/screens/event_screen/event_screen.dart';
import 'package:afu_hub_editor/ui/screens/home_screen.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/section_screen.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/topic_screen.dart';
import 'package:flutter/cupertino.dart';
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
            (s) => const HomeScreen(),
          ),
          AppRoute(
            ScreenPaths.topic,
            isFullscreenDialog: true,
            (s) => TopicScreen(goRouterState: s),
          ),
          AppRoute(
            ScreenPaths.event,
            isFullscreenDialog: true,
            (s) => EventScreen(goRouterState: s),
          ),
          AppRoute(
            ScreenPaths.section,
            isFullscreenDialog: true,
            (s) => SectionScreen(goRouterState: s),
          ),
        ]),
  ],
);

class AppRoute extends GoRoute {
  AppRoute(String path, Widget Function(GoRouterState s) builder,
      {List<GoRoute> routes = const [], this.isFullscreenDialog = false})
      : super(
          path: path,
          routes: routes,
          pageBuilder: (context, state) {
            return CupertinoPage(child: builder(state), fullscreenDialog: isFullscreenDialog);
          },
        );

  final bool isFullscreenDialog;
}
