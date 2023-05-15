import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../logic/section/repository/sections_repository.dart';
import '../../../../models/SectionData.dart';
import '../../../../strings.dart';

class SectionsSearchInput extends HookConsumerWidget {
  const SectionsSearchInput({
    required this.parentTopicId,
    required this.callback,
    Key? key,
  }) : super(key: key);

  final String? parentTopicId;
  final Function callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.listen(sectionsProvider, (_, __) {});
    final sectionList = ref.watch(sectionsProvider);

    late AsyncValue<List<SectionData?>> sectionsForTopicAsync;
    final sectionsForTopic = useState<List<SectionData>>([]);
    final initLoad = useState<bool>(true);
    if (parentTopicId != null && initLoad.value) {
      sectionsForTopicAsync = ref.watch(sectionsForTopicProvider(id: parentTopicId!));

      sectionsForTopicAsync.when(
          error: (_, __) => const Text('hello'),
          loading: () => const Text('Hello'),
          data: (data) => sectionsForTopic.value = [...data as List<SectionData>]);
      Future.delayed(1.seconds, () => initLoad.value = false);
    }
    return sectionList.when(
      error: (_, __) => const Text($Strings.errorOccurred),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (sections) => Column(
        children: [
          DropDownTextField(
            readOnly: true,
            enableSearch: true,
            clearOption: false,
            dropdownRadius: 10,
            dropDownItemCount: 5,
            textFieldDecoration: const InputDecoration(hintText: $Strings.sections),
            dropdownColor: Theme.of(context).colorScheme.surface,
            onChanged: (newValue) {
              String name = (newValue as DropDownValueModel).name;
              SectionData? section = sections.firstWhere((element) => element?.title.uk == name);
              sectionsForTopic.value = [...sectionsForTopic.value.toSet()..add(section!)];
              callback(sectionsForTopic.value);
            },
            dropDownList: List.from(
              sections.where((element) => !sectionsForTopic.value.contains(element)).map(
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
                  sectionsForTopic.value.length,
                  (index) => InputChip(
                    label: Text(sectionsForTopic.value[index].title.uk.toString()),
                    deleteIcon: const Icon(Icons.cancel_rounded),
                    onDeleted: () {
                      sectionsForTopic.value = [...sectionsForTopic.value..removeAt(index)];

                      callback(sectionsForTopic.value);
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
