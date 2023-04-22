import 'package:afu_hub_editor/logic/event/controller/event_controller.dart';
import 'package:afu_hub_editor/models/ModelProvider.dart';
import 'package:afu_hub_editor/ui/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../router.dart';
import '../../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../common/date_picker.dart';
import '../screens/topic_screen/new_topic_screen.dart';

final loadingStateProvider = StateProvider<bool>((ref) => false);
final containerHeightProvider = StateProvider<double>((ref) => 48);

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

  Widget _buildPage(WidgetRef ref, BuildContext context) {
    final ukTitleController = useTextEditingController();
    final enTitleController = useTextEditingController();
    final eventDateController = useTextEditingController();
    final coverImage = ref.watch(coverImageProvider);
    //final topicTypeController = useDropDownController();
    final isLoading = ref.watch(loadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            resetState(ref);
            appRouter.pop();
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
                const CoverImageCard(),
                const Gap(20),
                buildTopicTextFormField(
                  controller: ukTitleController,
                  hintText: $Strings.eventTitleUk,
                  errorText: $Strings.enterEventTitleUk,
                  validator: validateUkInput,
                ),
                const Gap(20),
                buildTopicTextFormField(
                  controller: enTitleController,
                  hintText: $Strings.eventTitleEn,
                  errorText: $Strings.enterEventTitleEn,
                  validator: validateEnInput,
                ),
                const Gap(20),
                buildTopicTextFormField(
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
                const TopicSearchInput(/* controller: topicTypeController*/),
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
                    print('Picked topic is: ${ref.read(topicForEventProvider)}');
                    if (currentState == null) return;
                    if (currentState.validate()) {
                      ref.read(loadingStateProvider.notifier).state = true;
                      final topic = ref.read(topicForEventProvider);

                      await ref.read(eventControllerProvider).addEvent(
                          date: eventDateController.text,
                          titleUk: ukTitleController.text,
                          titleEn: enTitleController.text,
                          topicdataID: topic!.id);

                      // if (coverImage != null) {
                      //   final topic = await ref.read(topicControllerProvider).queryTopicWithId(id);
                      //   if (topic != null) {
                      //     ref.read(topicControllerProvider).uploadFile(coverImage, topic);
                      //   }
                      // }
                      resetState(ref);
                      appRouter.pop();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _buildPage(ref, context);
  }
}
