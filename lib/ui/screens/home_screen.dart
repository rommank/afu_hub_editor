import 'package:afu_hub_editor/ui/screens/sections_screen/sections_screen.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../router.dart';
import '../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'events_screen/events_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  List<Widget> _buildHomeTabs(List<String> titles) {
    return [
      Tab(
        icon: const Icon(Icons.newspaper_outlined),
        text: titles[0],
      ),
      Tab(
        icon: const Icon(Icons.category_outlined),
        text: titles[1],
      ),
      Tab(
        icon: const Icon(Icons.event),
        text: titles[2],
      ),
    ];
  }

  void _addButtonPressed(int index) {
    if (index == 0) appRouter.push(ScreenPaths.topic);
    if (index == 1) appRouter.push(ScreenPaths.section);
    if (index == 2) appRouter.push(ScreenPaths.event);
  }

  String _pickTooltip(int index) {
    switch (index) {
      case 0:
        return $Strings.addTopicTooltip;
      case 1:
        return $Strings.addSectionTooltip;
      default:
        return $Strings.addEventTooltip;
    }
  }

  Future<void> _signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> titles = <String>[
      $Strings.topics,
      $Strings.sections,
      $Strings.events,
    ];
    final tabController = useTabController(initialLength: titles.length);
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Theme.of(context).shadowColor,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            controller: tabController,
            tabs: _buildHomeTabs(titles),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _signOutCurrentUser,
            ),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          physics: kIsWeb ? const NeverScrollableScrollPhysics() : const BouncingScrollPhysics(),
          children: const [
            TopicsScreen(),
            SectionsScreen(),
            EventsScreen(),
          ],
        ),
        floatingActionButtonLocation:
            kIsWeb ? FloatingActionButtonLocation.endFloat : FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          isExtended: kIsWeb,
          onPressed: () => _addButtonPressed(tabController.index),
          tooltip: _pickTooltip(tabController.index),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
