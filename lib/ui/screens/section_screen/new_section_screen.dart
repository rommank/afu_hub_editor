import 'package:afu_hub_editor/ui/screens/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/section/controller/section_controller.dart';
import '../../../router.dart';
import '../../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../topic_screen/new_topic_screen.dart';

class NewSectionScreen extends HookConsumerWidget {
  NewSectionScreen({
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
    final parentTopicController = useDropDownController();
    final ukTitleController = useTextEditingController();
    final enTitleController = useTextEditingController();
    final ukText1Controller = useTextEditingController();
    final enText1Controller = useTextEditingController();
    final coverImage = ref.watch(coverImageProvider);

    final isLoading = ref.watch(loadingStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text($Strings.newSection),
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
                    constraints: constraints,
                    context: context,
                    ukTitleController: ukTitleController,
                    enTitleController: enTitleController,
                    ukText1Controller: ukText1Controller,
                    enText1Controller: enText1Controller,
                    isLoading: isLoading,
                    ref: ref,
                    parentTopicController: parentTopicController),
              )
            : buildSingleChildScrollView(
                constraints: constraints,
                context: context,
                ukTitleController: ukTitleController,
                enTitleController: enTitleController,
                ukText1Controller: ukText1Controller,
                enText1Controller: enText1Controller,
                isLoading: isLoading,
                ref: ref,
                parentTopicController: parentTopicController);
      }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      {required BoxConstraints constraints,
      required BuildContext context,
      required TextEditingController ukTitleController,
      required TextEditingController enTitleController,
      required TextEditingController ukText1Controller,
      required TextEditingController enText1Controller,
      required SingleValueDropDownController parentTopicController,
      required bool isLoading,
      required WidgetRef ref}) {
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
              const CoverImageCard(label: $Strings.addIcon),
              const Gap(30),
              TopicSearchInput(controller: parentTopicController),
              const Gap(40),
              buildCustomTextFormField(
                maxLength: 15,
                context: context,
                controller: ukTitleController,
                hintText: $Strings.sectionTitleUk,
                errorText: $Strings.enterSectionTitleUk,
                validator: validateUkInput,
              ),
              const Gap(20),
              buildCustomTextFormField(
                maxLength: 15,
                context: context,
                controller: enTitleController,
                hintText: $Strings.sectionTitleEn,
                errorText: $Strings.enterSectionTitleEn,
                validator: validateEnInput,
              ),
              const Gap(30),
              buildCustomTextFormField(
                context: context,
                keyboardType: TextInputType.multiline,
                controller: ukText1Controller,
                hintText: $Strings.sectionText1Uk,
                errorText: $Strings.enterSectionText1Uk,
                minLines: 3,
                maxLines: 100,
                validator: validateEnInput,
              ),
              const Gap(30),
              buildCustomTextFormField(
                context: context,
                keyboardType: TextInputType.multiline,
                controller: enText1Controller,
                hintText: $Strings.sectionText1En,
                errorText: $Strings.enterSectionText1En,
                minLines: 3,
                maxLines: 100,
                validator: validateEnInput,
              ),
              const Gap(30),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text($Strings.quote1Uk, style: Theme.of(context).textTheme.bodyLarge),
                      const Gap(15),
                      buildCustomTextFormField(
                        maxLength: 15,
                        context: context,
                        controller: ukTitleController,
                        hintText: $Strings.quote1AuthorUk,
                        errorText: $Strings.enterQuote1AuthorUk,
                        //validator: validateUkInput,
                      ),
                      const Gap(10),
                      buildCustomTextFormField(
                        context: context,
                        keyboardType: TextInputType.multiline,
                        controller: enText1Controller,
                        hintText: $Strings.quote1TextUk,
                        errorText: $Strings.enterQuote1TextUk,
                        minLines: 3,
                        maxLines: 100,
                        //validator: validateUkInput,
                      ),
                    ],
                  ),
                ),
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
                    ref.read(loadingStateProvider.notifier).state = true;
                    final topic = ref.read(topicForEventProvider);

                    await ref.read(sectionControllerProvider).addSection(
                        nameUk: ukTitleController.text,
                        nameEn: enTitleController.text,
                        text1Uk: ukText1Controller.text,
                        text1En: enText1Controller.text,
                        order: '1',
                        topicId: topic!.id);

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
