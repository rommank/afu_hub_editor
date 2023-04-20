import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/events_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topics_search_input.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/listenable_value.dart';
import '../../../logic/event/repository/events_repository.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/topic/controller/topic_controller.dart';
import '../../../models/Topic.dart';
import '../../../router.dart';
import '../../../strings.dart';
import '../../common/date_picker.dart';

final loadingStateProvider = StateProvider<bool>((ref) => false);
final containerHeightProvider = StateProvider<double>((ref) => 48);

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
    final startDateController = useTextEditingController();
    final endDateController = useTextEditingController();
    final coverImage = ref.watch(coverImageProvider);
    final topicTypeController = useListenableState(SingleValueDropDownController());
    final isLoading = ref.watch(loadingStateProvider);

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
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formGlobalKey,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 15,
                  top: 20,
                  right: 15,
                  bottom: 0), // MediaQuery.of(context).viewInsets.bottom + 15),
              width: double.infinity,
              child: Column(
                children: [
                  const CoverImageCard(),
                  const Gap(20),
                  buildTopicTextFormField(
                    controller: ukTitleController,
                    hintText: $Strings.titleUk,
                    errorText: $Strings.enterTitleUk,
                    // validator: validateUkInput,
                  ),
                  const Gap(20),
                  buildTopicTextFormField(
                    controller: enTitleController,
                    hintText: $Strings.titleEn,
                    errorText: $Strings.enterTitleEn,
                    validator: validateEnInput,
                  ),
                  const Gap(20),
                  buildTopicTextFormField(
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
                  const Gap(20),
                  buildTopicTextFormField(
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
                  const SectionsSearchInput(),
                  const Gap(20),
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
                          await ref.read(eventsRepositoryProvider).updateTopicId(id, events);
                        }

                        if (coverImage != null) {
                          final topic =
                              await ref.read(topicControllerProvider).queryTopicWithId(id);
                          if (topic != null) {
                            ref.read(topicControllerProvider).uploadFile(coverImage, topic);
                          }
                        }
                        resetState(ref);
                        appRouter.go(ScreenPaths.home);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
