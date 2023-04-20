import 'package:afu_hub_editor/ui/screens/topics_screen/topic_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../logic/topic/repository/topics_repository.dart';
import '../../../strings.dart';

class TopicsScreen extends HookConsumerWidget {
  const TopicsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsStreamProvider);
    return topics.when(
      error: (e, st) => Text("${$Strings.errorOccurred}: $e"),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (topics) => topics.isEmpty
          ? const Center(
              child: Text($Strings.emptyTopicList),
            )
          : GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(10),
              children: topics.map((topic) => TopicCard(topic: topic!)).toList(),
            ),
    );
  }
}
