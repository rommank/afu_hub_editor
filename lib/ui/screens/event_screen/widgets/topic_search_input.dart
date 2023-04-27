import 'package:afu_hub_editor/logic/topic/repository/topics_repository.dart';
import 'package:afu_hub_editor/models/LocalizedText.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../models/Topic.dart';
import '../../../../models/TopicData.dart';
import '../../../../strings.dart';

final topicForEventProvider = StateProvider<TopicData?>((ref) => null);

class TopicSearchInput extends HookConsumerWidget {
  const TopicSearchInput({
    this.parentTopicId,
    required this.controller,
    Key? key,
  }) : super(key: key);

  final SingleValueDropDownController controller;
  final String? parentTopicId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsList = ref.watch(topicsStreamProvider);

    return topicsList.when(
        error: (_, __) => const Text($Strings.errorOccurred),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (topics) {
          if (parentTopicId != null) {
            final parentTopic = topics.firstWhere((topic) => topic?.id == parentTopicId,
                orElse: () => TopicData(
                    title: LocalizedText(uk: '', en: ''),
                    type: Topic.MODERN_ARMY,
                    startDate: TemporalDate(DateTime.now()),
                    endDate: TemporalDate(DateTime.now())));
            controller.setDropDown(DropDownValueModel(
                name: parentTopic!.title.uk.toString(), value: parentTopic.title.uk.toString()));
          }

          return Column(
            children: [
              DropDownTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return $Strings.enterTopic;
                  }
                  return null;
                },
                readOnly: true,
                enableSearch: true,
                clearOption: false,
                dropdownRadius: 10,
                dropDownItemCount: 5,
                controller: controller,
                textFieldDecoration: const InputDecoration(hintText: $Strings.topic),
                dropdownColor: Theme.of(context).colorScheme.surface,
                onChanged: (newValue) {
                  String name = (newValue as DropDownValueModel).name;
                  TopicData? topic = topics.firstWhere((element) => element?.title.uk == name);
                  ref.read(topicForEventProvider.notifier).state = topic;
                },
                dropDownList: List.from(
                  topics.map(
                    (items) => DropDownValueModel(
                      name: items!.title.uk.toString(),
                      value: items.title.uk.toString(),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
