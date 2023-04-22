import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../strings.dart';
import 'event_card.dart';

class EventsScreen extends HookConsumerWidget {
  const EventsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(eventsProvider);
    return eventsAsync.when(
      error: (e, st) => Text("${$Strings.errorOccurred}: $e"),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (events) => events.isEmpty
          ? const Center(
              child: Text($Strings.emptyTopicList),
            )
          : GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(10),
              children: events.map((event) => EventCard(event: event!)).toList(),
            ),
    );
  }
}
