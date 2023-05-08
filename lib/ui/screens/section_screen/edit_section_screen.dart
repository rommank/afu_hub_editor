import 'package:afu_hub_editor/ui/screens/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/widgets/draggable_card.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/widgets/quote_form.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../hooks/drop_down_controller_hook.dart';
import '../../../logic/notifiers/new_topic_screen_notifiers.dart';
import '../../../logic/section/controller/section_controller.dart';
import '../../../models/SectionData.dart';
import '../../../router.dart';
import '../../../strings.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../topic_screen/new_topic_screen.dart';

class EditSectionScreen extends HookConsumerWidget {
  EditSectionScreen({
    this.goRouterState,
    Key? key,
  }) : super(key: key);

  final GoRouterState? goRouterState;
  final formGlobalKey = GlobalKey<FormState>();
  final quote1FormGlobalKey = GlobalKey<FormState>();

  final term1FormGlobalKey = GlobalKey<FormState>();

  void resetState(WidgetRef ref) {
    ref.read(containerHeightProvider.notifier).state = 48;
    ref.read(loadingStateProvider.notifier).state = false;
    ref.read(addedEventsProvider.notifier).clear();
    ref.read(addedSectionsProvider.notifier).clear();
    ref.read(coverImageProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = goRouterState?.extra as SectionData;

    final parentTopicController = useDropDownController();
    final ukTitleController = useTextEditingController(text: section.title.uk);
    final enTitleController = useTextEditingController(text: section.title.en);
    final ukText1Controller = useTextEditingController(text: section.text1.uk);
    final enText1Controller = useTextEditingController(text: section.text1.en);
    final quote1UkAuthorController = useTextEditingController(text: section.quote1?.author?.uk);
    final quote1UkTextController = useTextEditingController(text: section.quote1?.text?.uk);
    final quote1EnAuthorController = useTextEditingController(text: section.quote1?.author?.en);
    final quote1EnTextController = useTextEditingController(text: section.quote1?.text?.en);
    final term1TermUkTextController =
        useTextEditingController(text: section.termToExplain1?.term?.uk);
    final term1TermEnTextController =
        useTextEditingController(text: section.termToExplain1?.term?.en);
    final term1TextUkTextController =
        useTextEditingController(text: section.termToExplain1?.meaning?.uk);
    final term1TextEnTextController =
        useTextEditingController(text: section.termToExplain1?.meaning?.en);
    final callout1UkTextController = useTextEditingController(text: section.callout1?.uk);
    final callout1EnTextController = useTextEditingController(text: section.callout1?.en);

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
                    section: section,
                    constraints: constraints,
                    context: context,
                    ukCallout1Controller: callout1UkTextController,
                    enCallout1Controller: callout1EnTextController,
                    ukTitleController: ukTitleController,
                    enTitleController: enTitleController,
                    ukText1Controller: ukText1Controller,
                    enText1Controller: enText1Controller,
                    quote1UkAuthorController: quote1UkAuthorController,
                    quote1UkTextController: quote1UkTextController,
                    quote1EnAuthorController: quote1EnAuthorController,
                    quote1EnTextController: quote1EnTextController,
                    term1TermUkTextController: term1TermUkTextController,
                    term1TermEnTextController: term1TermEnTextController,
                    term1MeaningUkTextController: term1TextUkTextController,
                    term1MeaningEnTextController: term1TextEnTextController,
                    isLoading: isLoading,
                    ref: ref,
                    parentTopicController: parentTopicController),
              )
            : buildSingleChildScrollView(
                section: section,
                constraints: constraints,
                context: context,
                ukCallout1Controller: callout1UkTextController,
                enCallout1Controller: callout1EnTextController,
                ukTitleController: ukTitleController,
                enTitleController: enTitleController,
                ukText1Controller: ukText1Controller,
                enText1Controller: enText1Controller,
                quote1UkAuthorController: quote1UkAuthorController,
                quote1UkTextController: quote1UkTextController,
                quote1EnAuthorController: quote1EnAuthorController,
                quote1EnTextController: quote1EnTextController,
                term1TermUkTextController: term1TermUkTextController,
                term1TermEnTextController: term1TermEnTextController,
                term1MeaningUkTextController: term1TextUkTextController,
                term1MeaningEnTextController: term1TextEnTextController,
                isLoading: isLoading,
                ref: ref,
                parentTopicController: parentTopicController);
      }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      {required SectionData section,
      required BoxConstraints constraints,
      required BuildContext context,
      required TextEditingController ukTitleController,
      required TextEditingController enTitleController,
      required TextEditingController ukText1Controller,
      required TextEditingController enText1Controller,
      required TextEditingController ukCallout1Controller,
      required TextEditingController enCallout1Controller,
      required TextEditingController quote1UkAuthorController,
      required TextEditingController quote1UkTextController,
      required TextEditingController quote1EnAuthorController,
      required TextEditingController quote1EnTextController,
      required TextEditingController term1TermUkTextController,
      required TextEditingController term1TermEnTextController,
      required TextEditingController term1MeaningUkTextController,
      required TextEditingController term1MeaningEnTextController,
      required SingleValueDropDownController parentTopicController,
      required bool isLoading,
      required WidgetRef ref}) {
    final horizontalPadding = calculatePadding(constraints.maxWidth);
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(horizontalPadding, 25, horizontalPadding, 25),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formGlobalKey,
        child: Column(
          children: [
            const CoverImageCard(label: $Strings.addIcon),
            const Gap(30),
            TopicSearchInput(controller: parentTopicController, parentTopicId: section.topicId),
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
            ReorderableListView(
              onReorderStart: (_) => HapticFeedback.lightImpact(),
              onReorderEnd: (_) => HapticFeedback.lightImpact(),
              shrinkWrap: true,
              onReorder: (a, b) {},
              physics: const ClampingScrollPhysics(),
              children: [
                DraggableCard(
                  key: const ValueKey('text1'),
                  children: [
                    Text($Strings.text1, style: Theme.of(context).textTheme.bodyLarge),
                    const Gap(15),
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
                  ],
                ),
                DraggableCard(
                  key: const ValueKey('quote1'),
                  children: [
                    QuoteForm(
                      formGlobalKey: quote1FormGlobalKey,
                      titleUk: $Strings.quote1Uk,
                      titleEn: $Strings.quote1En,
                      authorUk: $Strings.quote1AuthorUk,
                      authorEn: $Strings.quote1AuthorEn,
                      textUk: $Strings.quote1TextUk,
                      textEn: $Strings.quote1AuthorEn,
                      quoteUkAuthorController: quote1UkAuthorController,
                      quoteEnAuthorController: quote1EnAuthorController,
                      quoteUkTextController: quote1UkTextController,
                      quoteEnTextController: quote1EnTextController,
                    ),
                  ],
                ),
                DraggableCard(
                  key: const ValueKey('term1'),
                  children: [
                    QuoteForm(
                      formGlobalKey: term1FormGlobalKey,
                      titleUk: $Strings.term1Uk,
                      titleEn: $Strings.term1En,
                      authorUk: $Strings.term1TermUk,
                      authorEn: $Strings.term1TermEn,
                      textUk: $Strings.term1TextUk,
                      textEn: $Strings.term1TextEn,
                      quoteUkAuthorController: term1TermUkTextController,
                      quoteEnAuthorController: term1TermEnTextController,
                      quoteUkTextController: term1MeaningUkTextController,
                      quoteEnTextController: term1MeaningEnTextController,
                    ),
                  ],
                ),
                DraggableCard(
                  key: const ValueKey('callout1'),
                  children: [
                    Text($Strings.callout1, style: Theme.of(context).textTheme.bodyLarge),
                    const Gap(15),
                    buildCustomTextFormField(
                      context: context,
                      keyboardType: TextInputType.multiline,
                      controller: ukCallout1Controller,
                      hintText: $Strings.sectionText1Uk,
                      errorText: $Strings.enterSectionText1Uk,
                      minLines: 3,
                      maxLines: 100,
                      validator: (value) {
                        if ((value == null || value.isEmpty) &&
                            enCallout1Controller.text.isNotEmpty) {
                          return $Strings.textFieldIsMandatory;
                        }
                        return null;
                      },
                    ),
                    const Gap(30),
                    buildCustomTextFormField(
                      context: context,
                      keyboardType: TextInputType.multiline,
                      controller: enCallout1Controller,
                      hintText: $Strings.sectionText1En,
                      errorText: $Strings.enterSectionText1En,
                      minLines: 3,
                      maxLines: 100,
                      validator: (value) {
                        if ((value == null || value.isEmpty) &&
                            ukCallout1Controller.text.isNotEmpty) {
                          return $Strings.textFieldIsMandatory;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ],
            ),
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
                final quoteFormCurrentState = quote1FormGlobalKey.currentState;
                final termFormCurrentState = term1FormGlobalKey.currentState;
                if (currentState == null ||
                    quoteFormCurrentState == null ||
                    termFormCurrentState == null) return;

                if (currentState.validate() &&
                    quoteFormCurrentState.validate() &&
                    termFormCurrentState.validate()) {
                  ref.read(loadingStateProvider.notifier).state = true;
                  final topic = ref.read(topicForEventProvider);

                  await ref.read(sectionControllerProvider).addSection(
                      nameUk: ukTitleController.text,
                      nameEn: enTitleController.text,
                      text1Uk: ukText1Controller.text,
                      text1En: enText1Controller.text,
                      quote1AuthorUk: quote1UkAuthorController.text,
                      quote1AuthorEn: quote1EnAuthorController.text,
                      quote1TextUk: quote1UkTextController.text,
                      quote1TextEn: quote1EnTextController.text,
                      term1TermUk: term1TermUkTextController.text,
                      term1TermEn: term1TermEnTextController.text,
                      term1MeaningUk: term1MeaningUkTextController.text,
                      term1MeaningEn: term1MeaningEnTextController.text,
                      callout1Uk: ukCallout1Controller.text,
                      callout1En: enCallout1Controller.text,
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
    );
  }
}
