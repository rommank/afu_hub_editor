import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../hooks/drop_down_controller_hook.dart';
import '../../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../../logic/section/repository/sections_datastore_repository.dart';
import '../../../../logic/section/repository/sections_repository.dart';
import '../../../../models/SectionData.dart';
import '../../../../strings.dart';

class EditSectionsSearchInput extends HookConsumerWidget {
  const EditSectionsSearchInput({
    required this.topicId,
    Key? key,
  }) : super(key: key);

  final String topicId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValueController = useDropDownController();
    final itemsForTopic = ref.watch(addedSectionsProvider);
    AsyncValue<List<SectionData?>> sectionsForTopicAsync =
        ref.watch(sectionsForTopicProvider(id: topicId));

    final itemsList = ref.watch(sectionsProvider);

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
            textFieldDecoration: const InputDecoration(hintText: $Strings.sections),
            dropdownColor: Theme.of(context).colorScheme.surface,
            onChanged: (newValue) {
              dropdownValueController.clearDropDown();
              String name = (newValue as DropDownValueModel).name;
              SectionData? section = items.firstWhere((element) => element?.title.uk == name);
              ref.read(addedSectionsProvider.notifier).addValue(section!);
            },
            dropDownList: List.from(
              items.where((element) => !ref.read(addedSectionsProvider).contains(element)).map(
                    (items) => DropDownValueModel(
                      name: items!.title.uk.toString(),
                      value: items.title.uk.toString(),
                    ),
                  ),
            ),
          ),
          const Gap(5),
          sectionsForTopicAsync.when(
              error: (_, __) => const Text($Strings.errorOccurred),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (data) {
                return Column(
                  children: [
                    Wrap(
                      spacing: 4,
                      children: List.generate(
                        data.length,
                        (index) => InputChip(
                          label: Text((data[index])!.title.uk.toString()),
                          deleteIcon: const Icon(Icons.cancel_rounded),
                          onDeleted: () {
                            ref.read(addedSectionsProvider.notifier).removeValueAtIndex(index);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              })
        ],
      ),
    );
  }
}
