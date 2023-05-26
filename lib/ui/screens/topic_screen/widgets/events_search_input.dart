import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../models/EventData.dart';
import '../../../../strings.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EventsSearchInput extends HookConsumerWidget {
  const EventsSearchInput({
    required this.parentTopicId,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final String? parentTopicId;
  final Function callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventList = ref.watch(eventsProvider);

    late AsyncValue<List<EventData?>> eventsForTopicAsync;
    final eventsForTopic = useState<List<EventData>>([]);
    final initLoad = useState<bool>(true);
    if (parentTopicId != null && initLoad.value) {
      eventsForTopicAsync = ref.watch(eventsForTopicProvider(id: parentTopicId!));

      eventsForTopicAsync.when(
          error: (_, __) => const Text('hello'),
          loading: () => const Text('Hello'),
          data: (data) => eventsForTopic.value = [...data as List<EventData>]);
      Future.delayed(1.seconds, () => initLoad.value = false);
    }
    return eventList.when(
      error: (_, __) => const Text($Strings.errorOccurred),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (events) => Column(
        children: [
          DropDownTextField(
            readOnly: true,
            enableSearch: true,
            clearOption: false,
            dropdownRadius: 10,
            dropDownItemCount: 5,
            textFieldDecoration: const InputDecoration(hintText: $Strings.events),
            dropdownColor: Theme.of(context).colorScheme.surface,
            onChanged: (newValue) {
              String name = (newValue as DropDownValueModel).name;
              EventData? event = events.firstWhere((element) => element?.title.uk == name);
              eventsForTopic.value = [...eventsForTopic.value.toSet()..add(event!)];
              callback(eventsForTopic.value);
            },
            dropDownList: List.from(
              events.where((element) => !eventsForTopic.value.contains(element)).map(
                    (items) => DropDownValueModel(
                      name: items!.title.uk.toString(),
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
                  eventsForTopic.value.length,
                  (index) => InputChip(
                    label: Text(eventsForTopic.value[index].title.uk.toString()),
                    deleteIcon: const Icon(Icons.cancel_rounded),
                    onDeleted: () {
                      eventsForTopic.value = [...eventsForTopic.value..removeAt(index)];

                      callback(eventsForTopic.value);
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

// class EventsSearchInput extends HookConsumerWidget {
//   const EventsSearchInput({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dropdownValueController = useDropDownController();
//     final itemsForTopic = ref.watch(addedEventsProvider);
//
//     final itemsList = ref.watch(eventsProvider);
//
//     return itemsList.when(
//       error: (_, __) => const Text($Strings.errorOccurred),
//       loading: () => const Center(child: CircularProgressIndicator()),
//       data: (items) => Column(
//         children: [
//           DropDownTextField(
//             readOnly: true,
//             enableSearch: true,
//             clearOption: false,
//             dropdownRadius: 10,
//             dropDownItemCount: 5,
//             controller: dropdownValueController,
//             textFieldDecoration: const InputDecoration(hintText: $Strings.events),
//             dropdownColor: Theme.of(context).colorScheme.surface,
//             onChanged: (newValue) {
//               dropdownValueController.clearDropDown();
//               String name = (newValue as DropDownValueModel).name;
//               EventData? event = items.firstWhere((element) => element?.title.uk == name);
//               ref.read(addedEventsProvider.notifier).addValue(event!);
//             },
//             dropDownList: List.from(
//               items.where((element) => !ref.read(addedEventsProvider).contains(element)).map(
//                     (items) => DropDownValueModel(
//                       name: items!.title.uk.toString(),
//                       value: items.title.uk.toString(),
//                     ),
//                   ),
//             ),
//           ),
//           const Gap(5),
//           Column(
//             children: [
//               Wrap(
//                 spacing: 4,
//                 children: List.generate(
//                   itemsForTopic.length,
//                   (index) => InputChip(
//                     label: Text((itemsForTopic[index]).title.uk.toString()),
//                     deleteIcon: const Icon(Icons.cancel_rounded),
//                     onDeleted: () {
//                       ref.read(addedEventsProvider.notifier).removeValueAtIndex(index);
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
