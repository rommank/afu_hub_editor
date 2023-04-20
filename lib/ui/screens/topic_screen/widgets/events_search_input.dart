import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../hooks/listenable_value.dart';
import '../../../../logic/event/repository/events_repository.dart';
import '../../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../../models/EventData.dart';
import '../../../../strings.dart';

class EventsSearchInput extends HookConsumerWidget {
  const EventsSearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValueController = useListenableState(SingleValueDropDownController());
    final itemsForTopic = ref.watch(addedEventsProvider);

    final itemsList = ref.watch(eventsProvider);

    return itemsList.when(
      error: (_, __) => const Text($Strings.errorOccurred),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (items) => Column(
        children: [
          DropDownTextField(
            readOnly: true,
            enableSearch: true,
            clearOption: false,
            dropdownRadius: 10,
            dropDownItemCount: 5,
            controller: dropdownValueController,
            textFieldDecoration: const InputDecoration(hintText: $Strings.events),
            dropdownColor: Theme.of(context).colorScheme.surface,
            onChanged: (newValue) {
              dropdownValueController.clearDropDown();
              String name = (newValue as DropDownValueModel).name;
              EventData event = items.firstWhere((element) => element.title.uk == name);
              ref.read(addedEventsProvider.notifier).addValue(event);
            },
            dropDownList: List.from(
              items.where((element) => !ref.read(addedEventsProvider).contains(element)).map(
                    (items) => DropDownValueModel(
                      name: items.title.uk.toString(),
                      value: items.title.uk.toString(),
                    ),
                  ),
            ),
          ),
          const Gap(5),
          Column(
            children: [
              Wrap(
                spacing: 4,
                children: List.generate(
                  itemsForTopic.length,
                  (index) => InputChip(
                    label: Text((itemsForTopic[index]).title.uk.toString()),
                    deleteIcon: const Icon(Icons.cancel_rounded),
                    onDeleted: () {
                      ref.read(addedEventsProvider.notifier).removeValueAtIndex(index);
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
