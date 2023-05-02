import 'package:afu_hub_editor/logic/event/controller/event_controller.dart';
import 'package:afu_hub_editor/ui/screens/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../router.dart';
import '../../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../common/date_picker.dart';
import '../section_screen/new_section_screen.dart';
import '../topic_screen/new_topic_screen.dart';

class NewEventScreen extends HookConsumerWidget {
  NewEventScreen({
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

    final parentTopicController = useDropDownController();
    final isLoading = ref.watch(loadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text($Strings.newEvent),
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
                child: buildSingleChildScrollView(constraints, context, ukTitleController,
                    enTitleController, eventDateController, parentTopicController, isLoading, ref))
            : buildSingleChildScrollView(constraints, context, ukTitleController, enTitleController,
                eventDateController, parentTopicController, isLoading, ref);
      }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      BoxConstraints constraints,
      BuildContext context,
      TextEditingController ukTitleController,
      TextEditingController enTitleController,
      TextEditingController eventDateController,
      SingleValueDropDownController parentTopicController,
      bool isLoading,
      WidgetRef ref) {
    final coverImage = ref.watch(coverImageProvider);
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
              const CoverImageCard(label: $Strings.addImage),
              const Gap(30),
              TopicSearchInput(controller: parentTopicController),
              const Gap(40),
              buildCustomTextFormField(
                context: context,
                maxLength: 30,
                controller: ukTitleController,
                hintText: $Strings.eventTitleUk,
                errorText: $Strings.enterEventTitleUk,
                validator: validateUkInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                context: context,
                maxLength: 30,
                controller: enTitleController,
                hintText: $Strings.eventTitleEn,
                errorText: $Strings.enterEventTitleEn,
                validator: validateEnInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
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
                    String id = UUID.getUUID();
                    ref.read(loadingStateProvider.notifier).state = true;
                    final parentTopic = ref.read(topicForEventProvider);

                    await ref.read(eventControllerProvider).addEvent(
                          id: id,
                          date: eventDateController.text,
                          titleUk: ukTitleController.text,
                          titleEn: enTitleController.text,
                          topicId: parentTopic!.id,
                        );

                    if (coverImage != null) {
                      final event = await ref.read(eventControllerProvider).queryEventWithId(id);
                      ref.read(eventControllerProvider).uploadFile(coverImage, event!);
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
