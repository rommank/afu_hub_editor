import 'package:afu_hub_editor/logic/topic/repository/topics_repository.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../hooks/drop_down_controller_hook.dart';
import '../../../../models/TopicData.dart';
import '../../../../strings.dart';

final topicForEventProvider = StateProvider<TopicData?>((ref) => null);

class TopicSearchInput extends HookConsumerWidget {
  const TopicSearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValueController = useDropDownController();
    final topicsList = ref.watch(topicsStreamProvider);

    return topicsList.when(
      error: (_, __) => const Text($Strings.errorOccurred),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (topics) => Column(
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
            controller: dropdownValueController,
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
      ),
    );
  }
}
