import 'package:afu_hub_editor/models/EventData.dart';
import 'package:afu_hub_editor/ui/common/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/sections_search_input.dart';
import 'package:afu_hub_editor/ui/common/custom_text_form_field.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/section/repository/sections_repository.dart';
import '../../../logic/topic/controller/topic_controller.dart';
import '../../../logic/topic/repository/topics_repository.dart';
import '../../../models/LocalizedText.dart';
import '../../../models/SectionData.dart';
import '../../../models/TopicData.dart';
import '../../../router.dart';
import '../../../strings.dart';
import '../../common/delete_item_dialog.dart';

final loadingStateProvider = StateProvider<bool>((ref) => false);

class TopicScreen extends HookConsumerWidget {
  TopicScreen({Key? key, required this.goRouterState}) : super(key: key);

  final GoRouterState? goRouterState;
  final formGlobalKey = GlobalKey<FormState>();

  void resetState(WidgetRef ref) {
    ref.read(containerHeightProvider.notifier).state = 48;
    ref.read(loadingStateProvider.notifier).state = false;
    ref.read(addedEventsProvider.notifier).clear();
    ref.read(addedSectionsProvider.notifier).clear();
    ref.read(coverImageProvider.notifier).clear();
  }

  Future<bool> deleteTopic(BuildContext context, WidgetRef ref, TopicData topic) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const DeleteItemDialog(itemName: $Strings.topicAlt);
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
    final existingTopic = (goRouterState?.extra != null) ? goRouterState!.extra as TopicData : null;

    final coverImageValue = ref.watch(coverImageProvider);
    final isLoading = ref.watch(loadingStateProvider);
    final sectionsForTopic = useState<List<SectionData>>([]);
    final eventsForTopic = useState<List<EventData>>([]);

    final ukTitleController = useTextEditingController(text: existingTopic?.title.uk);
    final enTitleController = useTextEditingController(text: existingTopic?.title.en);

    String? formattedStartDate = existingTopic != null
        ? DateFormat($Strings.ukDateFormat).format(existingTopic.startDate.getDateTime())
        : null;
    final startDateController = useTextEditingController(text: formattedStartDate);

    String? formattedEndDate = existingTopic != null
        ? DateFormat($Strings.ukDateFormat).format(existingTopic.endDate.getDateTime())
        : null;
    final endDateController = useTextEditingController(text: formattedEndDate);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            resetState(ref);
            context.go(ScreenPaths.home);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formGlobalKey,
          child: Container(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 0),
            width: double.infinity,
            child: Column(
              children: [
                CoverImageCard(
                    imageKey: existingTopic?.bgImageKey, imageUrl: existingTopic?.bgImageUrl),
                const Gap(20),
                buildCustomTextFormField(
                  context: context,

                  autofocus: false,
                  controller: ukTitleController,
                  hintText: $Strings.topicTitleUk,
                  errorText: $Strings.enterTopicTitleUk,
                  //validator: validateUkInput,
                ),
                const Gap(20),
                buildCustomTextFormField(
                  context: context,
                  autofocus: false,
                  controller: enTitleController,
                  hintText: $Strings.topicTitleEn,
                  errorText: $Strings.enterTopicTitleEn,
                  validator: validateEnInput,
                ),
                const Gap(20),
                buildCustomTextFormField(
                  context: context,
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
                          DateFormat($Strings.ukDateFormat).parse(startDateController.text);
                      DateTime tempEndDate =
                          DateFormat($Strings.ukDateFormat).parse(endDateController.text);
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
                buildCustomTextFormField(
                  context: context,
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
                          DateFormat($Strings.ukDateFormat).parse(startDateController.text);
                      DateTime tempEndDate =
                          DateFormat($Strings.ukDateFormat).parse(endDateController.text);
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
                SectionsSearchInput(
                  parentTopicId: existingTopic?.id,
                  callback: (List<SectionData> val) {
                    sectionsForTopic.value = val;
                  },
                ),
                const Gap(20),
                //const EventsSearchInput(),
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

                          String id = UUID.getUUID();
                          (existingTopic == null)
                              ? ref.read(topicControllerProvider).addTopic(
                                    ref: ref,
                                    id: id,
                                    titleUk: ukTitleController.text,
                                    titleEn: enTitleController.text,
                                    startDate: startDateController.text,
                                    endDate: endDateController.text,
                                    sectionList: sectionsForTopic.value,
                                    eventList: eventsForTopic.value,
                                  )
                              : ref.read(topicControllerProvider).updateTopic(
                                    ref: ref,
                                    id: existingTopic.id,
                                    titleUk: ukTitleController.text,
                                    titleEn: enTitleController.text,
                                    startDate: startDateController.text,
                                    endDate: endDateController.text,
                                    sectionList: sectionsForTopic.value,
                                    eventList: eventsForTopic.value,
                                  );

                          // if (coverImageValue != null) {
                          //   final topicToModify =
                          //       await ref.read(topicControllerProvider).queryTopicWithId(topic.id);
                          //   if (topicToModify != null) {
                          //     ref.read(topicControllerProvider).uploadFile(coverImageValue, topic);
                          //   }
                          // }
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
                        await deleteTopic(context, ref, existingTopic!).then((confirm) {
                          if (confirm) appRouter.pop();
                        });
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
      ),
    );
  }
}
