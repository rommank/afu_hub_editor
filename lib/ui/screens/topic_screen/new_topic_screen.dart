import 'dart:io';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/events_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/sections_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/topic/controller/topic_controller.dart';
import '../../../router.dart';
import '../../../strings.dart';
import '../../common/date_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final loadingStateProvider = StateProvider<bool>((ref) => false);

class NewTopicScreen extends HookConsumerWidget {
  NewTopicScreen({
    Key? key,
  }) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();

  void resetState(WidgetRef ref) {
    ref.read(containerHeightProvider.notifier).state = 48;
    ref.read(loadingStateProvider.notifier).state = false;
    ref.read(addedEventsProvider.notifier).clear();
    ref.read(addedSectionsProvider.notifier).clear();
    ref.read(coverImageProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ukTitleController = useTextEditingController();
    final enTitleController = useTextEditingController();
    final eventDateController = useTextEditingController();
    final endDateController = useTextEditingController();
    final icon = ref.watch(coverImageProvider);
    final topicTypeController = useDropDownController();
    final isLoading = ref.watch(loadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text($Strings.newTopic),
        leading: IconButton(
          onPressed: () {
            resetState(ref);
            appRouter.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: LayoutBuilder(builder: (_, constraints) {
        return kIsWeb
            ? Center(
                child: buildSingleChildScrollView(
                    constraints,
                    context,
                    ukTitleController,
                    enTitleController,
                    eventDateController,
                    endDateController,
                    topicTypeController,
                    ref,
                    isLoading,
                    icon),
              )
            : buildSingleChildScrollView(constraints, context, ukTitleController, enTitleController,
                eventDateController, endDateController, topicTypeController, ref, isLoading, icon);
      }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      BoxConstraints constraints,
      BuildContext context,
      TextEditingController ukTitleController,
      TextEditingController enTitleController,
      TextEditingController startDateController,
      TextEditingController endDateController,
      SingleValueDropDownController topicTypeController,
      WidgetRef ref,
      bool isLoading,
      File? icon) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: calculatePadding(constraints.maxWidth)),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formGlobalKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 0),
          width: double.infinity,
          child: Column(
            children: [
              const CoverImageCard(),
              const Gap(20),
              buildCustomTextFormField(
                context: context,
                maxLength: 40,
                controller: ukTitleController,
                hintText: $Strings.topicTitleUk,
                errorText: $Strings.enterTopicTitleUk,
                validator: validateUkInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                context: context,
                maxLength: 40,
                controller: enTitleController,
                hintText: $Strings.topicTitleEn,
                errorText: $Strings.enterTopicTitleEn,
                validator: validateEnInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                context: context,
                controller: startDateController,
                hintText: $Strings.startDate,
                errorText: $Strings.enterDate,
                suffixIcon: Icons.edit_calendar_outlined,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return $Strings.enterDate;
                  }
                  if (endDateController.text.isNotEmpty) {
                    DateTime tempStartDate = parseDateString(startDateController.text);
                    DateTime tempEndDate = parseDateString(endDateController.text);
                    if (tempEndDate.isBefore(tempStartDate)) {
                      return $Strings.startBeforeStartDateError;
                    }
                  }

                  return null;
                },
                onTap: () => showCalendar(startDateController, context,
                        helpText: $Strings.pickStartDate.toUpperCase())
                    .then((value) => FocusScope.of(context).requestFocus(FocusNode())),
              ),
              const Gap(40),
              buildCustomTextFormField(
                context: context,
                controller: endDateController,
                hintText: $Strings.endDate,
                errorText: $Strings.enterDate,
                suffixIcon: Icons.edit_calendar_outlined,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return $Strings.enterDate;
                  }

                  if (startDateController.text.isNotEmpty) {
                    DateTime tempStartDate = parseDateString(startDateController.text);
                    DateTime tempEndDate = parseDateString(endDateController.text);
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
              const Gap(40),
              const SectionsSearchInput(),
              const Gap(40),
              const EventsSearchInput(),
              const Gap(20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Theme.of(context).colorScheme.primaryContainer),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 3))
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
                    await ref.read(topicControllerProvider).addTopic(
                          id: id,
                          titleUk: ukTitleController.text,
                          titleEn: enTitleController.text,
                          type: topicTypeController.dropDownValue?.name ?? '',
                          startDate: startDateController.text,
                          endDate: endDateController.text,
                        );

                    final sections = ref.read(addedSectionsProvider);
                    final events = ref.read(addedEventsProvider);

                    if (sections.isNotEmpty) {
                      await ref
                          .read(topicControllerProvider)
                          .updateTopicIdForSections(topicId: id, sections: sections);
                    }
                    if (events.isNotEmpty) {
                      await ref
                          .read(topicControllerProvider)
                          .updateTopicIdForEvents(topicId: id, events: events);
                    }

                    if (icon != null) {
                      final topic = await ref.read(topicControllerProvider).queryTopicWithId(id);
                      if (topic != null) {
                        ref.read(topicControllerProvider).uploadFile(icon, topic);
                      }
                    }
                    resetState(ref);
                    appRouter.pop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
