import 'package:afu_hub_editor/logic/event/controller/event_controller.dart';
import 'package:afu_hub_editor/logic/event/repository/events_repository.dart';
import 'package:afu_hub_editor/models/LocalizedText.dart';
import 'package:afu_hub_editor/ui/screens/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../models/EventData.dart';
import '../../../router.dart';
import '../../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../common/date_picker.dart';
import '../../common/delete_item_dialog.dart';
import '../section_screen/new_section_screen.dart';
import '../topic_screen/new_topic_screen.dart';

class EditEventScreen extends HookConsumerWidget {
  EditEventScreen({
    required this.eventId,
    Key? key,
  }) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();

  final String eventId;
  void resetState(WidgetRef ref) {
    ref.read(containerHeightProvider.notifier).state = 48;
    ref.read(loadingStateProvider.notifier).state = false;
    ref.read(addedEventsProvider.notifier).clear();
    ref.read(addedSectionsProvider.notifier).clear();
    ref.read(coverImageProvider.notifier).clear();
  }

  Future<bool> deleteEvent(BuildContext context, WidgetRef ref, EventData event) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (context) {
          return const DeleteItemDialog(itemName: $Strings.topicAlt);
        });
    value ??= false;
    if (value) {
      await ref.read(eventsRepositoryProvider).delete(event);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventAsync = ref.watch(singleEventProvider(id: eventId));
    final parentTopicController = useDropDownController();

    final coverImage = ref.watch(coverImageProvider);
    final isLoading = ref.watch(loadingStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text($Strings.editEvent),
        leading: IconButton(
          onPressed: () {
            resetState(ref);
            appRouter.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: eventAsync.when(
          error: (err, stack) => const Text($Strings.errorOccurred),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (event) {
            // parentTopicController.dropDownValue = DropDownValueModel(
            //     name: event.title.uk.toString(), value: event.title.uk.toString());
            final ukTitleController = useTextEditingController(text: event.title.uk.toString());
            final enTitleController = useTextEditingController(text: event.title.en.toString());

            String formattedEventDate =
                DateFormat($Strings.ukDateFormat).format(event.date.getDateTime());
            final eventDateController = useTextEditingController(text: formattedEventDate);
            return LayoutBuilder(
              builder: (_, constraints) {
                return kIsWeb
                    ? Center(
                        child: buildSingleChildScrollView(
                            event: event,
                            constraints: constraints,
                            context: context,
                            ukTitleController: ukTitleController,
                            enTitleController: enTitleController,
                            eventDateController: eventDateController,
                            parentTopicController: parentTopicController,
                            isLoading: isLoading,
                            parentTopicId: event.topicId,
                            ref: ref))
                    : buildSingleChildScrollView(
                        event: event,
                        constraints: constraints,
                        context: context,
                        ukTitleController: ukTitleController,
                        enTitleController: enTitleController,
                        eventDateController: eventDateController,
                        parentTopicController: parentTopicController,
                        isLoading: isLoading,
                        parentTopicId: event.topicId,
                        ref: ref);
              },
            );
          }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView({
    required EventData event,
    required BoxConstraints constraints,
    required BuildContext context,
    required TextEditingController ukTitleController,
    required TextEditingController enTitleController,
    required TextEditingController eventDateController,
    required SingleValueDropDownController parentTopicController,
    required bool isLoading,
    required WidgetRef ref,
    String? parentTopicId,
  }) {
    final coverImage = ref.watch(coverImageProvider);
    final horizontalPadding = calculatePadding(constraints.maxWidth);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, 25),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formGlobalKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 0),
          width: double.infinity,
          child: Column(
            children: [
              CoverImageCard(
                imageKey: event.iconKey,
                imageUrl: event.iconUrl,
              ),
              const Gap(30),
              TopicSearchInput(
                controller: parentTopicController,
                parentTopicId: parentTopicId,
              ),
              const Gap(40),
              buildCustomTextFormField(
                autofocus: false,
                context: context,
                maxLength: 30,
                controller: ukTitleController,
                hintText: $Strings.eventTitleUk,
                errorText: $Strings.enterEventTitleUk,
                //validator: validateUkInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                autofocus: false,
                context: context,
                maxLength: 30,
                controller: enTitleController,
                hintText: $Strings.eventTitleEn,
                errorText: $Strings.enterEventTitleEn,
                validator: validateEnInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                autofocus: false,
                context: context,
                controller: eventDateController,
                hintText: $Strings.eventDate,
                errorText: $Strings.enterEventDate,
                suffixIcon: Icons.edit_calendar_outlined,
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return $Strings.enterDate;
                  }

                  return null;
                },
                onTap: () => showCalendar(eventDateController, context,
                        helpText: $Strings.pickStartDate.toUpperCase())
                    .then((value) => FocusScope.of(context).requestFocus(FocusNode())),
              ),
              const Gap(20),
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
                        DateTime tempDate = DateFormat($Strings.ukDateFormat)
                            .parse(eventDateController.text.trim());
                        final date = TemporalDate(
                          tempDate.copyWith(day: tempDate.day + 1),
                        );
                        final title =
                            LocalizedText(uk: ukTitleController.text, en: enTitleController.text);
                        final parentTopicId = ref.read(topicForEventProvider)?.id.toString();
                        final updatedItem =
                            event.copyWith(date: date, title: title, topicId: parentTopicId);
                        await ref.read(eventControllerProvider).updateEvent(updatedItem);
                        if (coverImage != null) {
                          final updatedEvent =
                              await ref.read(eventControllerProvider).queryEventWithId(event.id);
                          ref.read(eventControllerProvider).uploadFile(coverImage, updatedEvent!);
                        }
                        resetState(ref);
                        appRouter.pop();
                      }
                    },
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Theme.of(context).colorScheme.errorContainer),
                    ),
                    onPressed: () async {
                      deleteEvent(context, ref, event).then((confirm) {
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
    );
  }
}
