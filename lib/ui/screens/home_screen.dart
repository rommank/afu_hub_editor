import 'package:afu_hub_editor/ui/screens/sections_screen/sections_screen.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import '../../router.dart';
import '../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'events_screen/events_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  List<Widget> _buildHomeTabs() {
    List<String> titles = <String>[
      $Strings.topics,
      $Strings.sections,
      $Strings.events,
    ];
    return [
      Tab(
        icon: const Icon(Icons.cloud_outlined),
        text: titles[0],
      ),
      Tab(
        icon: const Icon(Icons.beach_access_sharp),
        text: titles[1],
      ),
      Tab(
        icon: const Icon(Icons.brightness_5_sharp),
        text: titles[2],
      ),
    ];
  }

  void _addButtonPressed() {
    appRouter.push(ScreenPaths.newTopic);
  }

  Future<void> _signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Karolina"),
          shadowColor: Theme.of(context).shadowColor,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            tabs: _buildHomeTabs(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _signOutCurrentUser,
            ),
          ],
        ),
        body: const TabBarView(
          physics: kIsWeb ? NeverScrollableScrollPhysics() : AlwaysScrollableScrollPhysics(),
          children: [
            TopicsScreen(),
            SectionsScreen(),
            EventsScreen(),
          ],
        ),
        floatingActionButtonLocation: kIsWeb
            ? FloatingActionButtonLocation.centerFloat
            : FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          isExtended: kIsWeb,
          onPressed: _addButtonPressed,
          tooltip: $Strings.addTopicTooltip,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
