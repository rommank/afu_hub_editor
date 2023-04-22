import 'package:afu_hub_editor/logic/section/repository/sections_repository.dart';
import 'package:afu_hub_editor/ui/screens/sections_screen/section_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../strings.dart';

class SectionsScreen extends HookConsumerWidget {
  const SectionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionsAsync = ref.watch(sectionsProvider);
    return sectionsAsync.when(
      error: (e, st) => Text("${$Strings.errorOccurred}: $e"),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (sections) => sections.isEmpty
          ? const Center(
              child: Text($Strings.emptyTopicList),
            )
          : GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              padding: const EdgeInsets.all(10),
              children: sections.map((section) => SectionCard(section: section!)).toList(),
            ),
    );
  }
}
