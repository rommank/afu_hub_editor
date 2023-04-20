import 'dart:io' as io;
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/edit_sections_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/events_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../hooks/listenable_value.dart';
import '../../../logic/event/repository/events_repository.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/section/repository/sections_repository.dart';
import '../../../logic/topic/controller/topic_controller.dart';
import '../../../logic/topic/repository/topics_repository.dart';
import '../../../models/LocalizedText.dart';
import '../../../models/SectionData.dart';
import '../../../models/Topic.dart';
import '../../../models/TopicData.dart';
import '../../../router.dart';
import '../../../strings.dart';
import '../../common/delete_item_dialog.dart';
import 'new_topic_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditTopicScreen extends HookConsumerWidget {
  EditTopicScreen({Key? key, required this.topicId}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();

  void resetState(WidgetRef ref) {
    ref.read(containerHeightProvider.notifier).state = 48;
    ref.read(loadingStateProvider.notifier).state = false;
    ref.read(addedEventsProvider.notifier).clear();
    ref.read(addedSectionsProvider.notifier).clear();
    ref.read(coverImageProvider.notifier).clear();
  }

  final String topicId;
  Future<bool> deleteTopic(BuildContext context, WidgetRef ref, TopicData topic) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const DeleteItemDialog(itemName: $Strings.topic);
        });
    value ??= false;
    if (value) {
      await ref.read(topicsRepositoryProvider).delete(topic);
    }
    return value;
  }

  Future<void> showCalendar(TextEditingController controller, BuildContext context,
      {String? helpText}) async {
    DateTime? pickedDate = await showDatePicker(
        locale: const Locale($Strings.uk),
        helpText: helpText,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat($Strings.ukDateFormat).format(pickedDate);
      controller.text = formattedDate;
    } else {}
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<SectionData>> sectionsForTopicAsync =
        ref.watch(sectionsForTopicProvider(id: topicId));
    final topicAsync = ref.watch(singleTopicProvider(id: topicId));
    final ukTitleController = useTextEditingController();
    final enTitleController = useTextEditingController();
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();
    final coverImageValue = ref.watch(coverImageProvider);
    final isLoading = ref.watch(loadingStateProvider);
    final topicTypeController = useListenableState(SingleValueDropDownController());
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              resetState(ref);
              context.go(ScreenPaths.home);
            },
            icon: const Icon(Icons.close),
          ),
        ),
        body: topicAsync.when(
            error: (err, stack) => const Text($Strings.errorOccurred),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (data) {
              ukTitleController.text = data.title.uk ?? '';
              enTitleController.text = data.title.en ?? '';

              String formattedStartDate =
                  DateFormat('dd/MM/yyyy').format(data.startDate.getDateTime());
              startDateController.text = formattedStartDate;
              String formattedEndDate = DateFormat('dd/MM/yyyy').format(data.endDate.getDateTime());
              endDateController.text = formattedEndDate;
              topicTypeController
                  .setDropDown(DropDownValueModel(name: data.type.name, value: data.type.name));
              return SingleChildScrollView(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formGlobalKey,
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 0),
                    width: double.infinity,
                    child: Column(
                      children: [
                        CoverImageCard(imageKey: data.titleImageKey, imageUrl: data.titleImageUrl),
                        const Gap(20),
                        buildTopicTextFormField(
                          autofocus: false,
                          controller: ukTitleController,
                          hintText: $Strings.titleUk,
                          errorText: $Strings.enterTitleUk,
                          //validator: validateUkInput,
                        ),
                        const Gap(20),
                        buildTopicTextFormField(
                          autofocus: false,
                          controller: enTitleController,
                          hintText: $Strings.titleEn,
                          errorText: $Strings.enterTitleEn,
                          validator: validateEnInput,
                        ),
                        const Gap(20),
                        buildTopicTextFormField(
                          autofocus: false,
                          controller: startDateController,
                          hintText: $Strings.startDate,
                          errorText: $Strings.enterDate,
                          suffixIcon: Icons.edit_calendar_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return $Strings.enterDate;
                            }
                            if (endDateController.text.isNotEmpty) {
                              DateTime tempStartDate =
                                  DateFormat("dd/MM/yyyy").parse(startDateController.text);
                              DateTime tempEndDate =
                                  DateFormat("dd/MM/yyyy").parse(endDateController.text);
                              if (tempEndDate.isBefore(tempStartDate)) {
                                return $Strings.startBeforeStartDateError;
                              }
                            }

                            return null;
                          },
                          readOnly: true,
                          onTap: () => showCalendar(startDateController, context,
                                  helpText: $Strings.pickStartDate.toUpperCase())
                              .then((value) => FocusScope.of(context).requestFocus(FocusNode())),
                        ),
                        const Gap(20),
                        buildTopicTextFormField(
                          autofocus: false,
                          controller: endDateController,
                          hintText: $Strings.endDate,
                          errorText: $Strings.enterDate,
                          suffixIcon: Icons.edit_calendar_outlined,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return $Strings.enterDate;
                            }

                            if (startDateController.text.isNotEmpty) {
                              DateTime tempStartDate =
                                  DateFormat("dd/MM/yyyy").parse(startDateController.text);
                              DateTime tempEndDate =
                                  DateFormat("dd/MM/yyyy").parse(endDateController.text);
                              if (tempEndDate.isBefore(tempStartDate)) {
                                return $Strings.endBeforeStartDateError;
                              }
                            }

                            return null;
                          },
                          readOnly: true,
                          onTap: () => showCalendar(endDateController, context,
                                  helpText: $Strings.pickEndDate.toUpperCase())
                              .then((value) => FocusScope.of(context).requestFocus(FocusNode())),
                        ),
                        const Gap(20),
                        DropDownTextField(
                          controller: topicTypeController,
                          clearOption: false,
                          dropdownRadius: 10,
                          dropDownItemCount: 5,
                          textFieldDecoration: const InputDecoration(hintText: $Strings.topicType),
                          dropdownColor: Theme.of(context).colorScheme.surface,
                          onChanged: (newValue) {
                            String name = (newValue as DropDownValueModel).name;
                            Topic topic = Topic.values.byName(name);
                            ref.read(dropdownProvider.notifier).setValue(topic);
                          },
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            } else {
                              return $Strings.pickTopicType;
                            }
                          },
                          dropDownList: List.from(
                            Topic.values.map(
                              (element) => DropDownValueModel(
                                name: element.name,
                                value: element.name,
                              ),
                            ),
                          ),
                        ),
                        const Gap(20),
                        EditSectionsSearchInput(topicId: topicId),
                        const Gap(20),
                        const EventsSearchInput(),
                        const Gap(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Theme.of(context).colorScheme.primaryContainer),
                              ),
                              child: isLoading
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(strokeWidth: 3))
                                  : Icon(
                                      Icons.check,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              onPressed: () async {
                                final currentState = formGlobalKey.currentState;
                                if (currentState == null) return;
                                if (currentState.validate()) {
                                  ref.read(loadingStateProvider.notifier).state = true;
                                  DateTime tempStartDate =
                                      DateFormat("dd/MM/yyyy").parse(startDateController.text);

                                  DateTime tempEndDate =
                                      DateFormat("dd/MM/yyyy").parse(endDateController.text);

                                  final sections = ref.read(addedSectionsProvider);
                                  final events = ref.read(addedEventsProvider);
                                  TopicData updatedTopic = data.copyWith(
                                    title: LocalizedText(
                                        uk: ukTitleController.text, en: enTitleController.text),
                                    type: Topic.values
                                        .byName(topicTypeController.dropDownValue?.name ?? ''),
                                    startDate: TemporalDate(
                                      tempStartDate.copyWith(day: tempStartDate.day + 1),
                                    ),
                                    endDate: TemporalDate(
                                        tempEndDate.copyWith(day: tempEndDate.day + 1)),
                                  );
                                  ref.read(topicControllerProvider).update(updatedTopic);

                                  if (sections.isNotEmpty) {
                                    await ref
                                        .read(topicControllerProvider)
                                        .updateTopicIdForSections(
                                            topicId: topicId, sections: sections);
                                  }
                                  if (events.isNotEmpty) {
                                    await ref
                                        .read(eventsRepositoryProvider)
                                        .updateTopicId(topicId, events);
                                  }

                                  if (coverImageValue != null) {
                                    final topic = await ref
                                        .read(topicControllerProvider)
                                        .queryTopicWithId(topicId);
                                    if (topic != null) {
                                      ref
                                          .read(topicControllerProvider)
                                          .uploadFile(coverImageValue, topic);
                                    }
                                  }
                                  resetState(ref);
                                  appRouter.go(ScreenPaths.home);
                                }
                              },
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith(
                                    (states) => Theme.of(context).colorScheme.errorContainer),
                              ),
                              onPressed: () async {
                                await deleteTopic(context, ref, data)
                                    .then((value) => context.go(ScreenPaths.home));
                              },
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
