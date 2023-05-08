import 'package:afu_hub_editor/ui/screens/event_screen/widgets/topic_search_input.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/widgets/draggable_card.dart';
import 'package:afu_hub_editor/ui/screens/section_screen/widgets/quote_form.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/cover_image_card.dart';
import 'package:afu_hub_editor/ui/screens/topic_screen/widgets/topic_text_form_field.dart';
import 'package:afu_hub_editor/ui/screens/topics_screen/topics_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final parentTopicController = useDropDownController();
    final ukTitleController = useTextEditingController();
    final enTitleController = useTextEditingController();

    final ukText1Controller = useTextEditingController();
    final enText1Controller = useTextEditingController();
    final coverImage = ref.watch(coverImageProvider);

    final isLoading = ref.watch(loadingStateProvider);

    final quote1UkAuthorController = useTextEditingController();
    final quote1UkTextController = useTextEditingController();
    final quote1EnAuthorController = useTextEditingController();
    final quote1EnTextController = useTextEditingController();
    final term1TermUkTextController = useTextEditingController();
    final term1TermEnTextController = useTextEditingController();
    final term1TextUkTextController = useTextEditingController();
    final term1TextEnTextController = useTextEditingController();
    final callout1UkTextController = useTextEditingController();
    final callout1EnTextController = useTextEditingController();

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
      {required BoxConstraints constraints,
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

  // SingleChildScrollView buildSingleChildScrollView(
  //     {required BoxConstraints constraints,
  //     required BuildContext context,
  //     required TextEditingController ukTitleController,
  //     required TextEditingController enTitleController,
  //     required TextEditingController ukText1Controller,
  //     required TextEditingController enText1Controller,
  //     required TextEditingController quote1UkAuthorController,
  //     required TextEditingController quote1UkTextController,
  //     required TextEditingController quote1EnAuthorController,
  //     required TextEditingController quote1EnTextController,
  //     required TextEditingController term1TermUkTextController,
  //     required TextEditingController term1TermEnTextController,
  //     required TextEditingController term1TextUkTextController,
  //     required TextEditingController term1TextEnTextController,
  //     required SingleValueDropDownController parentTopicController,
  //     required bool isLoading,
  //     required WidgetRef ref}) {
  //   final horizontalPadding = calculatePadding(constraints.maxWidth);
  //   return SingleChildScrollView(
  //     padding: EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, 25),
  //     child: Form(
  //       autovalidateMode: AutovalidateMode.onUserInteraction,
  //       key: formGlobalKey,
  //       child: Container(
  //         padding: const EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 0),
  //         width: double.infinity,
  //         child: Column(
  //           children: [
  //             const CoverImageCard(label: $Strings.addIcon),
  //             const Gap(30),
  //             TopicSearchInput(controller: parentTopicController),
  //             const Gap(40),
  //             buildCustomTextFormField(
  //               maxLength: 15,
  //               context: context,
  //               controller: ukTitleController,
  //               hintText: $Strings.sectionTitleUk,
  //               errorText: $Strings.enterSectionTitleUk,
  //               validator: validateUkInput,
  //             ),
  //             const Gap(20),
  //             buildCustomTextFormField(
  //               maxLength: 15,
  //               context: context,
  //               controller: enTitleController,
  //               hintText: $Strings.sectionTitleEn,
  //               errorText: $Strings.enterSectionTitleEn,
  //               validator: validateEnInput,
  //             ),
  //             const Gap(30),
  //             buildCustomTextFormField(
  //               context: context,
  //               keyboardType: TextInputType.multiline,
  //               controller: ukText1Controller,
  //               hintText: $Strings.sectionText1Uk,
  //               errorText: $Strings.enterSectionText1Uk,
  //               minLines: 3,
  //               maxLines: 100,
  //               validator: validateEnInput,
  //             ),
  //             const Gap(30),
  //             buildCustomTextFormField(
  //               context: context,
  //               keyboardType: TextInputType.multiline,
  //               controller: enText1Controller,
  //               hintText: $Strings.sectionText1En,
  //               errorText: $Strings.enterSectionText1En,
  //               minLines: 3,
  //               maxLines: 100,
  //               validator: validateEnInput,
  //             ),
  //             const Gap(30),
  //             QuoteForm(
  //                 title: $Strings.quote1Uk,
  //                 author: $Strings.quote1AuthorUk,
  //                 text: $Strings.quote1TextUk,
  //                 formGlobalKey: quote1UkFormGlobalKey,
  //                 quoteAuthorController: quote1UkAuthorController,
  //                 quoteTextController: quote1UkTextController),
  //             const Gap(20),
  //             QuoteForm(
  //                 title: $Strings.quote1En,
  //                 author: $Strings.quote1AuthorUk,
  //                 text: $Strings.quote1TextUk,
  //                 formGlobalKey: quote1EnFormGlobalKey,
  //                 quoteAuthorController: quote1EnAuthorController,
  //                 quoteTextController: quote1EnTextController),
  //             QuoteForm(
  //                 title: $Strings.term1Uk,
  //                 author: $Strings.term1TermUk,
  //                 text: $Strings.term1TextUk,
  //                 formGlobalKey: term1UkFormGlobalKey,
  //                 quoteAuthorController: term1TermUkTextController,
  //                 quoteTextController: term1TextUkTextController),
  //             QuoteForm(
  //                 title: $Strings.term1En,
  //                 author: $Strings.term1TermEn,
  //                 text: $Strings.term1TextEn,
  //                 formGlobalKey: term1EnFormGlobalKey,
  //                 quoteAuthorController: term1TermEnTextController,
  //                 quoteTextController: term1TextEnTextController),
  //             const Gap(20),
  //             ElevatedButton(
  //               style: ButtonStyle(
  //                 backgroundColor: MaterialStateProperty.resolveWith(
  //                     (states) => Theme.of(context).colorScheme.primaryContainer),
  //               ),
  //               child: isLoading
  //                   ? const SizedBox(
  //                       height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 3))
  //                   : Icon(
  //                       Icons.check,
  //                       color: Theme.of(context).colorScheme.onSurface,
  //                     ),
  //               onPressed: () async {
  //                 final currentState = formGlobalKey.currentState;
  //                 final quoteFormCurrentState = quote1UkFormGlobalKey.currentState;
  //                 if (currentState == null) return;
  //                 if (quoteFormCurrentState == null) return;
  //
  //                 if (currentState.validate()) {
  //                   if (quoteFormCurrentState.validate()) {
  //                     // ref.read(loadingStateProvider.notifier).state = true;
  //                     // final topic = ref.read(topicForEventProvider);
  //                     //
  //                     // await ref.read(sectionControllerProvider).addSection(
  //                     //     nameUk: ukTitleController.text,
  //                     //     nameEn: enTitleController.text,
  //                     //     text1Uk: ukText1Controller.text,
  //                     //     text1En: enText1Controller.text,
  //                     //     order: '1',
  //                     //     topicId: topic!.id);
  //                     //
  //                     // resetState(ref);
  //                     // appRouter.pop();
  //                   }
  //                 }
  //               },
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
